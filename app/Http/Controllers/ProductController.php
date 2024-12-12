<?php

namespace App\Http\Controllers;

use App\Models\Attributes;
use App\Models\Category;
use App\Models\Product;
use App\Models\Specification;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

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
        ]);

        $slug = Str::slug($validatedData['name']);

        $product = Product::create([
            'name' => $validatedData['name'],
            'sku' => $validatedData['sku'],
            'slug' => $slug,
            'description' => $validatedData['description'],
            'price' => $validatedData['price'],
            'category_id' => $validatedData['category_id'],
        ]);

        return response()->json([
            'message' => 'Product created successfully',
            'product' => $product,
        ], 201);
    }

    public function edit($id)
    {
        $product = Product::findOfFail($id);
        return view('products.edit', compact('product'));
    }

    public function update($id)
    {
        $product = Product::findOrFail($id);

        request()->validate([
            'name' => 'required',
            'price' => 'required',
            'quantity' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
    }
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $product->delete();
    }

}
