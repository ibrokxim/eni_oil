<?php

namespace App\Http\Controllers;

use App\Imports\ProductsImport;
use App\Models\PRS;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::query()->paginate(20);
        return view('products.index', compact('products'));
    }

    public function create()
    {
        return view('products.create');
    }
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string',
            'sku' => 'string|max:255',
            'application' => 'nullable|string|max:255',
            'for_client' => 'nullable|string|max:255',
            'eco_friendly' => 'nullable|string|max:255',
            'price' => 'required|numeric|min:0',
            'category_id' => 'required|exists:categories,id',
            'specifications' => 'nullable|array',
            'specifications.*.name' => 'required_with:specifications|string|max:255',
            'specifications.*.value' => 'required_with:specifications|string|max:255',
            'specifications.*.code' => 'required_with:specifications|string|max:255',
            'attributes' => 'nullable|array',
            'attributes.*.name' => 'required_with:attributes|string|max:255',
            'attributes.*.value' => 'required_with:attributes|string|max:255',
            'attributes.*.code' => 'required_with:attributes|string|max:255',
            'images' => 'nullable|array',
            'images.*' => 'image|max:2048',
        ]);

        $slug = Str::slug($validatedData['name']);

        $product = Product::create([
            'name' => $validatedData['name'],
            'sku' => $validatedData['sku'] ?? null,
            'slug' => $slug,
            'description' => $validatedData['description'] ?? null,
            'price' => $validatedData['price'],
            'category_id' => $validatedData['category_id'],
            'application' => $validatedData['application'] ?? null,
            'for_client' => $validatedData['for_client'] ?? null,
            'eco_friendly' => $validatedData['eco_friendly'] ?? null,
        ]);

        if (!empty($request->specifications)) {
            foreach ($request->specifications as $specification) {
                $spec = Specification::create($specification);
                $product->specifications()->attach($spec->id);
            }
        }

        if (!empty($request->attributes)) {
            foreach ($request->attributes as $attribute) {
                $attr = Attributes::create($attribute);
                $product->attributes()->attach($attr->id);
            }
        }

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $path = $image->store('images', 'public');
                $product->images()->create(['url' => $path]);
            }
        }

        return response()->json([
            'message' => 'Product created successfully',
            'product' => $product,
        ], 201);
    }

    public function edit(Product $product, $id)
    {
        $product = Product::findOrFail($id);
        return view('products.edit', compact('product'));
    }

    public function update(Request $request, Product $product)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'required|string|max:255',
            'application' => 'nullable|string',
            'client_benefits' => 'nullable|string',
            'warnings' => 'nullable|string',
            'eco_friendly' => 'nullable|string',
            'photo' => 'nullable|file|image',
            'technical_specification' => 'nullable|file',
            'commercial_offer' => 'nullable|file',
        ]);

        if ($request->hasFile('photo')) {
            if ($product->photo) {
                Storage::delete($product->photo);
            }
            $data['photo'] = $request->file('photo')->store('photos');
        }

        if ($request->hasFile('technical_specification')) {
            if ($product->technical_specification) {
                Storage::delete($product->technical_specification);
            }
            $data['technical_specification'] = $request->file('technical_specification')->store('technical_specifications');
        }

        if ($request->hasFile('commercial_offer')) {
            if ($product->commercial_offer) {
                Storage::delete($product->commercial_offer);
            }
            $data['commercial_offer'] = $request->file('commercial_offer')->store('commercial_offers');
        }

        $product->update($data);

        return redirect()->route('products.index')->with('success', 'Product updated successfully.');
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();

        return response()->json([
            'message' => 'Product deleted successfully',
        ], 200);
    }

    public function showPRS()
    {
        $prs = PRS::all();
        return view('products.prs', compact('prs'));
    }

    public function importForm()
    {
        return view('test');
    }
    public function import(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx', // Разрешаем только CSV
        ]);

        Excel::import(new ProductsImport, $request->file('file'));

        return redirect()->back()->with('success', 'Products imported successfully.');
    }
}
