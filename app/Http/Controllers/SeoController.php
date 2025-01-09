<?php

// app/Http/Controllers/SEOController.php
namespace App\Http\Controllers;

use App\Models\SEO;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SeoController extends Controller
{
    public function index()
    {
        $seo = SEO::all();
        return view('seo.index', compact('seo'));
    }

    public function create()
    {
        $products = Product::all();
        $categories = Category::all();
        return view('seo.create', compact('products', 'categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'page' => 'required|string|max:255',
            'slug' => 'required|string|max:255',
            'h1' => 'nullable|string|max:255',
            'meta_title' => 'nullable|string|max:255',
            'meta_description' => 'nullable|string',
            'keywords' => 'nullable|string',
            'scripts' => 'nullable|string',
            'og:title' => 'nullable|string|max:255',
            'og:description' => 'nullable|string',
            'og:image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'canonical' => 'nullable|string|max:255',
        ]);

        $seo = new Seo();
        $seo->page = $request->page;
        $seo->slug = $request->slug;
        $seo->h1 = $request->h1;
        $seo->meta_title = $request->meta_title;
        $seo->meta_description = $request->meta_description;
        $seo->keywords = $request->keywords;
        $seo->scripts = $request->scripts;
        $seo->{'og:title'} = $request->{'og:title'};
        $seo->{'og:description'} = $request->{'og:description'};

        if ($request->hasFile('og:image')) {
            $ogImagePath = $request->file('og:image')->store('seo_images', 'public');
            $seo->{'og:image'} = Storage::url($ogImagePath);
        }

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('seo_images', 'public');
            $seo->image = Storage::url($imagePath);
        }

        $seo->canonical = $request->canonical;

        $seo->save();

        return redirect()->route('seo.index')->with('success', 'SEO settings created successfully.');
    }

    public function edit($id)
    {
        $seo = Seo::findOrFail($id);
        return view('seo.edit', compact('seo'));
    }

    public function update(Request $request, $id)
    {
        $seo = Seo::findOrFail($id);

        $request->validate([
            'page' => 'required|string|max:255',
            'slug' => 'required|string|max:255',
            'h1' => 'nullable|string|max:255',
            'meta_title' => 'nullable|string|max:255',
            'meta_description' => 'nullable|string',
            'keywords' => 'nullable|string',
            'scripts' => 'nullable|string',
            'og:title' => 'nullable|string|max:255',
            'og:description' => 'nullable|string',
            'og:image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'canonical' => 'nullable|string|max:255',
        ]);

        $seo->page = $request->page;
        $seo->slug = $request->slug;
        $seo->h1 = $request->h1;
        $seo->meta_title = $request->meta_title;
        $seo->meta_description = $request->meta_description;
        $seo->keywords = $request->keywords;
        $seo->scripts = $request->scripts;
        $seo->{'og:title'} = $request->{'og:title'};
        $seo->{'og:description'} = $request->{'og:description'};

        if ($request->hasFile('og:image')) {
            $ogImagePath = $request->file('og:image')->store('seo_images', 'public');
            $seo->{'og:image'} = Storage::url($ogImagePath);
        }

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('seo_images', 'public');
            $seo->image = Storage::url($imagePath);
        }

        $seo->canonical = $request->canonical;

        $seo->save();

        return redirect()->route('seo.index')->with('success', 'SEO settings updated successfully.');
    }

    public function destroy($id)
    {
        $seo = Seo::findOrFail($id);
        $seo->delete();

        return redirect()->route('seo.index')->with('success', 'SEO settings deleted successfully.');
    }
}
