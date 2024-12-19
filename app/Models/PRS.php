<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PRS extends Model
{
    use HasFactory;
    protected $fillable = ['code', 'name', 'kg_per_unit', 'liters_per_unit'];

}
