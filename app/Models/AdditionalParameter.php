<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AdditionalParameter extends Model
{
    use HasFactory;
    protected $fillable = ['product_id', 'parameter_name', 'parameter_value', 'unit'];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class);
    }
}
