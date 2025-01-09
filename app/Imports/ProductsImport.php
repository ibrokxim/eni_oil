<?php

namespace App\Imports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithStartRow;

class ProductsImport implements ToModel, WithHeadingRow, WithStartRow
{
    public function model(array $row)
    {
        return new Product([
            'product_code' => $row[0],
            'product_name' => $row[1],
            'macro_category' => $row[2],
            'additional_data' => json_encode($row) // Сохраняем все данные в JSON-поле
        ]);
    }

    public function startRow(): int
    {
        return 2;
    }
}
