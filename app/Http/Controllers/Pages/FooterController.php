<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use App\Models\Footer;
use Illuminate\Http\Request;

class FooterController extends Controller
{
    public function index()
    {
        return view('pages.index');
    }

    public function edit($id)
    {
        $footer = Footer::findOrFail($id);
        return view('pages.footer.edit', compact('footer'));
    }

    public function update($id, Request $request)
    {
        $footer = Footer::findOrFail($id);
        $request->validate([
            'number' => 'required|string|max:255',
            'email' => 'required|email',
            'address' => 'required',
            'socials' => 'nullable',
            'name' => 'required',
        ]);

        $footer->number = $request->number;
        $footer->email = $request->email;
        $footer->address = $request->address;
        $footer->socials = $request->socials;
        $footer->name = $request->name;
        $footer->save();
        return redirect()->route('pages.index')->with('success', 'Footer updated successfully');
    }

    public function apiResponse()
    {
        $aboutPage = Footer::first(); // Assuming there's only one About page

        if (!$aboutPage) {
            return response()->json(['message' => 'Page not found'], 404);
        }

        return response()->json($aboutPage);
    }
}
