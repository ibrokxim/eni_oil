<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'product_code', 'product_name', 'macro_category', 'subcategory_1', 'subcategory_2',
        'application', 'client_benefits', 'warnings', 'eco_friendly', 'additional_data',
        'photo', 'technical_specification', 'commercial_offer'
    ];

    protected $casts = [
        'additional_data' => 'array',
    ];

    public function getAdditionalDataAttribute($value)
    {
        return json_decode($value, true);
    }

    public function setAdditionalDataAttribute($value)
    {
        $this->attributes['additional_data'] = json_encode($value);
    }

}
