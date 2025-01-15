<?php

// app/Imports/ProductsImport.php
namespace App\Imports;

use App\Models\Product;
use App\Models\ProductFeature;
use App\Models\ProductSpecification;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class ProductsImport implements ToModel, WithMultipleSheets
{
    public function model(array $row)
    {
        $product = Product::create([
            'code' => $row[0],
            'name' => $row[2],
            'category' => $row[8],
            'subcategory_1' => $row[9],
            'subcategory_2' => $row[10],
            'application' => $row[24],
            'client_benefits' => $row[25],
            'warnings' => $row[26],
            'eco_friendly' => isset($row[27]) && strtolower($row[27]) === 'yes',
        ]);

        // Импорт характеристик
        for ($i = 28; $i <= 218; $i++) {
            if (!empty($row[$i])) {
                ProductFeature::create([
                    'product_id' => $product->id,
                    'feature_name' => 'Feature ' . ($i - 27),
                    'feature_value' => $row[$i]
                ]);
            }
        }

        // Импорт спецификаций
        for ($i = 219; $i <= 326; $i++) {
            if (!empty($row[$i])) {
                ProductSpecification::create([
                    'product_id' => $product->id,
                    'specification_name' => 'Specification ' . ($i - 218),
                    'specification_value' => $row[$i]
                ]);
            }
        }

        return $product;
    }

    public function sheets(): array
    {
        return [
            0 => new ProductsImport(),
        ];
    }
}
