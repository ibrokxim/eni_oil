<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::query()->paginate(20);
        return view('categories.index', compact('categories'));
    }

    public function create()
    {
        $categories = Category::all();
        return view('categories.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255',
            'parent_id' => 'nullable|exists:categories,id',
        ]);

        $slug = Str::slug($validatedData['name']);
        while (Category::where('slug', $slug)->exists()) {
            $slug = $slug . '-' . uniqid();
        }

        $category = Category::create([
            'name' => $validatedData['name'],
            'slug' => $slug,
            'parent_id' => $validatedData['parent_id'] ?? null,
        ]);

        return redirect()->route('categories.index')->with('success', 'Category created successfully.');
    }

    public function edit($id)
    {
        $category = Category::findOrFail($id);
        $categories = Category::all();
        return view('categories.edit', compact('category', 'categories'));
    }

    public function update(Request $request, Category $category)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'parent_id' => 'nullable|exists:categories,id',
        ]);

        if ($category->name !== $validatedData['name']) {
            $slug = Str::slug($validatedData['name']);
            while (Category::where('slug', $slug)->exists()) {
                $slug = $slug . '-' . uniqid();
            }
            $category->slug = $slug;
        }

        $category->update([
            'name' => $validatedData['name'],
            'parent_id' => $validatedData['parent_id'] ?? null,
        ]);

        return redirect()->route('categories.index')->with('success', 'Category updated successfully.');
    }



    public function destroy($id)
    {
        $category = Category::findOrFail($id);
        $category->delete();
        return redirect()->route('categories.index');
    }
}
