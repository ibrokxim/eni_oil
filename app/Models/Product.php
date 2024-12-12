<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $table = 'products';
    protected $fillable = ['name', 'sku', 'application','for_clients','warnings','eco_friendly','slug'];

    public function attributes()
    {
        return $this->belongsToMany(Attributes::class, 'product_attributes');
    }

    public function specifications()
    {
        return $this->belongsToMany(Specification::class, 'product_specifications');
    }

    public function categories()
    {
        return $this->belongsToMany(Category::class, 'product_category');
    }


}
