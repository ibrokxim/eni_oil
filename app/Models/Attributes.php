<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attributes extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'code'];

    public function products()
    {
        return $this->belongsToMany(Product::class, 'product_attributes');
    }

}