<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Support\Str;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'code', 'name', 'category', 'subcategory_1', 'subcategory_2',
        'application', 'client_benefits', 'warnings', 'eco_friendly',
        'photo', 'technical_specification', 'commercial_offer'
    ];

    public static function boot()
    {
        parent::boot();

        static::creating(function ($product) {
            $product->slug = Str::slug($product->name);
        });

        static::updating(function ($product) {
            $product->slug = Str::slug($product->name);
        });
    }


    public function features()
    {
        return $this->hasMany(ProductFeature::class);
    }

    public function specifications()
    {
        return $this->hasMany(ProductSpecification::class);
    }

}
