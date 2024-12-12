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
            $table->integer('sku');
            $table->string('name');
            $table->string('slug')->nullable();
            $table->text('application')->nullable();
            $table->text('for_clients')->nullable();
            $table->string('warnings')->nullable();
            $table->string('eco_friendly')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
