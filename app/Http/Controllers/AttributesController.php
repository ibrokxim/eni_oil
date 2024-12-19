<?php

namespace App\Http\Controllers;

use App\Models\Attributes;
use App\Models\Category;
use Illuminate\Http\Request;

class AttributesController extends Controller
{

    public function index()
    {
        $attributes = Attributes::query()->paginate(20);
        return view('attributes.index', compact('attributes'));
    }

    public function create()
    {
        return view('attributes.create');
    }


    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'nullable|string|max:255',
            'value' => 'required|string|max:255',
        ]);
        
        $attributes = Attributes::create([
            'name' => $validatedData['name'],
            'code' => $validatedData['code'],
            'value' => $validatedData['value'],
        ]);

        return redirect()->route('attributes.index')->with('success', 'Attributes created successfully.');
    }

    public function edit(Attributes $attributes, $id)
    {
        $categories = Category::all();
        $attributes = Attributes::findOrFail($id);
        return view('attributes.edit', compact('attributes', 'categories'));
    }

    public function update(Request $request, Attributes $attributes)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'nullable|string|max:255',
            'value' => 'nullable|exists:categories,id',
        ]);


        $attributes->update([
            'name' => $validatedData['name'],
            'code' => $validatedData['code'],
            'value' => $validatedData['value'] ?? null,
        ]);

        return redirect()->route('categories.index')->with('success', 'Category updated successfully.');
    }

    public function destroy(Attributes $attributes, $id)
    {
        $attributes = Attributes::findOrFail($id);
        $attributes->delete($id);
        return redirect()->route('attributes.index');
    }
}
