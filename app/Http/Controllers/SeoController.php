<?php

// app/Http/Controllers/SEOController.php
namespace App\Http\Controllers;

use App\Models\SEO;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;

class SeoController extends Controller
{
    public function index()
    {
        $seos = SEO::all();
        return view('seo.index', compact('seos'));
    }

    public function create()
    {
        $products = Product::all();
        $categories = Category::all();
        return view('seo.create', compact('products', 'categories'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'slug' => 'required|string|max:255|unique:seos',
            'title' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'keywords' => 'nullable|string',
            'position' => 'required|string|in:header,footer',
            'type' => 'required|string|in:product,category,global',
            'type_id' => 'nullable|integer',
        ]);

        SEO::create($validatedData);

        return redirect()->route('seo.index')->with('success', 'SEO data created successfully.');
    }

    public function edit($id)
    {
        $seo = SEO::findOrFail($id);
        $products = Product::all();
        $categories = Category::all();
        return view('seo.edit', compact('seo', 'products', 'categories'));
    }

    public function update(Request $request, $id)
    {
        $seo = SEO::findOrFail($id);

        $validatedData = $request->validate([
            'slug' => 'required|string|max:255|unique:seos,slug,' . $seo->id,
            'title' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'keywords' => 'nullable|string',
            'position' => 'required|string|in:header,footer',
            'type' => 'required|string|in:product,category,global',
            'type_id' => 'nullable|integer',
        ]);

        $seo->update($validatedData);

        return redirect()->route('seo.index')->with('success', 'SEO data updated successfully.');
    }

    public function destroy($id)
    {
        $seo = SEO::findOrFail($id);
        $seo->delete();

        return redirect()->route('seo.index')->with('success', 'SEO data deleted successfully.');
    }
}
