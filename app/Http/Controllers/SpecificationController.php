<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Specification;

class SpecificationController extends Controller
{
    public function index()
    {
        $specifications = Specification::query()->paginate(20);
        return view('specifications.index', compact('specifications'));
    }

    public function create()
    {
        return view('specifications.create');
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'nullable|string|max:255',
            'value' => 'required|string|max:255',
        ]);

        $attributes = Specification::create([
            'name' => $validatedData['name'],
            'code' => $validatedData['code'],
            'value' => $validatedData['value'],
        ]);

        return redirect()->route('attributes.index')->with('success', 'Attributes created successfully.');
    }


    public function edit($id)
    {
        $specification = Specification::findOrFail($id);
        return view('specifications.edit', compact('specification'));
    }

    public function update(Request $request, Specification $specification)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'code' => 'nullable|string|max:255',
            'value' => 'string|max:255',
        ]);


        $specification->update([
            'name' => $validatedData['name'],
            'code' => $validatedData['code'],
            'value' => $validatedData['value'] ?? null,
        ]);

        return redirect()->route('categories.index')->with('success', 'Category updated successfully.');

    }

    public function destroy($id)
    {
        $specification = Specification::findOrFail($id);
        $specification->delete();
        return redirect()->route('specifications.index');
    }
}
