<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use App\Models\About;
use Illuminate\Http\Request;

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

    public function update(\Illuminate\Http\Client\Request $request, $id)
    {
        $aboutPage = About::findOrFail($id);
        $aboutPage->update($request->all());
        return redirect()->route('pages.index')->with('success', 'Page updated successfully');
    }
}
