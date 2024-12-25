<?php

namespace App\Http\Controllers\Pages;

use App\Http\Controllers\Controller;
use App\Models\Main;
use Illuminate\Http\Request;

class MainPageController extends Controller
{
    public function apiResponse()
    {
        $aboutPage = Main::first(); // Assuming there's only one About page

        if (!$aboutPage) {
            return response()->json(['message' => 'Page not found'], 404);
        }

        return response()->json($aboutPage);
    }
}
