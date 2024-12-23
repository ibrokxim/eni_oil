<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seo extends Model
{
    use HasFactory;


    protected $fillable = [
        'slug', 'title', 'description', 'keywords', 'position', 'type', 'type_id'
    ];

    public function typeable()
    {
        return $this->morphTo();
    }
}
