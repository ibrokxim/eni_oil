<?php

namespace App\Http\Controllers;

use App\Models\PRS;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\Specification;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::query()->paginate(20);
        return view('products.index', compact('products'));
    }

    public function create()
    {
        $categories = Category::all();
        $specifications = Specification::all();
        $attributes = Attributes::all();
        return view('products.create', compact('categories', 'specifications', 'attributes'));
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

    public function edit($id)
    {
        $product = Product::findOrFail($id);
        $categories = Category::all();
        $specifications = Specification::all();
        $attributes = Attributes::all();
        return view('products.edit', compact('product', 'categories', 'specifications', 'attributes'));
    }

    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

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

        $product->update([
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

        $product->specifications()->detach();
        if (!empty($request->specifications)) {
            foreach ($request->specifications as $specification) {
                $spec = Specification::create($specification);
                $product->specifications()->attach($spec->id);
            }
        }

        $product->attributes()->detach();
        if (!empty($request->attributes)) {
            foreach ($request->attributes as $attribute) {
                $attr = Attributes::create($attribute);
                $product->attributes()->attach($attr->id);
            }
        }

        if ($request->hasFile('images')) {
            $product->images()->delete();
            foreach ($request->file('images') as $image) {
                $path = $image->store('images', 'public');
                $product->images()->create(['url' => $path]);
            }
        }

        return response()->json([
            'message' => 'Product updated successfully',
            'product' => $product,
        ], 200);
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
}
