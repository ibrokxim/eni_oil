<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function getProducts()
    {
        $products = Product::query()->paginate(24);
        return response()->json($products);
    }

    public function getProductById($id)
    {
        $product = Product::find($id);
        return response()->json($product);
    }
}
