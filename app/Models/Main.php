<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Main extends Model
{
    use HasFactory;
    protected $table = 'mains';
    protected $fillable = [
        'title',
        'main_image',
        'about',
        'second_title',
        'description',
        'brands'
    ];
}
