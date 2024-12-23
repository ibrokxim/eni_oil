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

    protected $fillable = ['material_code', 'product_name', 'category_id'];

    public function category():BelongsTo
    {
        return $this->belongsTo(Category::class);
    }

    public function details():HasOne
    {
        return $this->hasOne(ProductDetail::class);
    }

    public function specifications():HasMany
    {
        return $this->hasMany(Specification::class);
    }

    public function physicalProperties():HasMany
    {
        return $this->hasMany(PhysicalProperty::class);
    }

    public function additionalParameters():HasMany
    {
        return $this->hasMany(AdditionalParameter::class);
    }
    public function images():MorphMany
    {
        return $this->morphMany(Image::class, 'imageable');
    }

}
