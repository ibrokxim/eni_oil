<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use App\Models\Main;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MainPageController extends Controller
{
    public function edit($id)
    {
        $mainPage = Main::findOrFail($id);
        return view('pages.main.edit', compact('mainPage'));
    }
    public function update($id, Request $request)
    {
        $mainPage = Main::findOrFail($id);
        $request->validate([
            'title' => 'required|string|max:255',
            'main_image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            'about' => 'nullable|string',
            'second_title' => 'nullable|string',
            'description' => 'nullable|string',
            'brands' => 'nullable|string',
        ]);

        $mainPage->title = $request->title;
        $mainPage->about = $request->about;
        $mainPage->second_title = $request->second_title;
        $mainPage->description = $request->description;
        $mainPage->brands = $request->brands;

        if ($request->hasFile('main_image')) {
            $mainImagePath = $request->file('main_image')->store('main_images', 'public');
            $mainPage->main_image = Storage::url($mainImagePath);
        }

        $mainPage->save();
        return redirect()->route('pages.index')->with('success', 'Page updated successfully');
    }
    public function apiResponse()
    {
        $aboutPage = Main::first(); // Assuming there's only one About page

        if (!$aboutPage) {
            return response()->json(['message' => 'Page not found'], 404);
        }

        return response()->json($aboutPage);
    }
}
