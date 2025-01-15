<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function getProducts()
    {
        // Выбираем только нужные поля
        $products = Product::query()
            ->select('id', 'photo', 'name', 'code', 'slug')
            ->paginate(24);

        $products->getCollection()->transform(function ($product) {
            return [
                'id' => $product->id,
                'photo' => $product->photo,
                'name' => $product->name,
                'product_code' => $product->code,
                'slug' => $product->slug,
            ];
        });

        return response()->json($products);
    }

    public function getProductBySlug($slug)
    {
        $product = Product::where('slug', $slug)->firstOrFail();
        return response()->json($product);
    }
    public function getProductsByCategory($category)
    {
        // Предполагаем, что категория передается в URL в кодировке UTF-8
        $category = urldecode($category);
        $products = Product::where('category', $category)
            ->paginate(24);

//        $products->getCollection()->transform(function ($product) {
//            return [
//                'id' => $product->id,
//                'photo' => $product->photo,
//                'name' => $product->name,
//                'product_code' => $product->code,
//                'slug' => $product->slug,
//            ];
//        });

        return response()->json($products);
    }
}
