<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('code');
            $table->string('name');
            $table->string('category');
            $table->string('subcategory_1')->nullable();
            $table->string('subcategory_2')->nullable();
            $table->text('application')->nullable();
            $table->text('client_benefits')->nullable();
            $table->text('warnings')->nullable();
            $table->boolean('eco_friendly')->default(false);
            $table->string('photo')->nullable();
            $table->string('technical_specification')->nullable();
            $table->string('commercial_offer')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
