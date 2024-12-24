<?php

namespace App\Http\Controllers\Pages;

use App\Models\About;
use App\Http\Controllers\Controller;

class PageController extends Controller
{
    public function index()
    {
        $aboutPage = About::all();
        return view('pages.index', compact('aboutPage'));
    }

}
