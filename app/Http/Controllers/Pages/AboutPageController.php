<?php

namespace App\Http\Controllers\Pages;

use App\Models\About;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class AboutPageController extends Controller
{
    public function index()
    {
        return view('pages.index');
    }


    public function edit($id)
    {
        $aboutPage = About::findOrFail($id);
        return view('pages.about.edit', compact('aboutPage'));
    }

    public function update(Request $request, $id)
    {
        $aboutPage = About::findOrFail($id);
        $request->validate([
            'title' => 'required|string|max:255',
            'main_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'first_description' => 'nullable|string',
            'second_description' => 'nullable|string',
            'first_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'second_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
        ]);

        $aboutPage->title = $request->title;
        $aboutPage->first_description = $request->first_description;
        $aboutPage->second_description = $request->second_description;

        if ($request->hasFile('main_image'))
        {
            $mainImagePath = $request->file('main_image')->store('about_images', 'public');
            $aboutPage->main_image = Storage::url($mainImagePath);
        }

        if ($request->hasFile('first_image'))
        {
            $firstImagePath = $request->file('first_image')->store('about_images', 'public');
            $aboutPage->first_image = Storage::url($firstImagePath);
        }

        if ($request->hasFile('second_image'))
        {
            $secondImagePath = $request->file('second_image')->store('about_images', 'public');
            $aboutPage->second_image = Storage::url($secondImagePath);
        }

        $aboutPage->save();
        return redirect()->route('pages.index')->with('success', 'Page updated successfully');
    }

    public function apiResponse()
    {
        $aboutPage = About::first(); // Assuming there's only one About page

        if (!$aboutPage) {
            return response()->json(['message' => 'Page not found'], 404);
        }

        return response()->json($aboutPage);
    }
}
