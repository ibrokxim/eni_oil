<?php

namespace App\Http\Controllers\Pages;

use App\Models\About;
use App\Http\Controllers\Controller;
use App\Models\Footer;
use App\Models\Main;

class PageController extends Controller
{
    public function index()
    {
        $aboutPage = About::all();
        $mainPage = Main::all();
        $footer = Footer::all();
        return view('pages.index', compact('aboutPage', 'mainPage', 'footer'));
    }

}
