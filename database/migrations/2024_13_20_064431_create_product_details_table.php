<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('product_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->onDelete('cascade');
            $table->text('application')->nullable(); // ПРИМЕНЕНИЕ
            $table->text('customer_benefits')->nullable(); // ПРЕИМУЩЕСТВА ДЛЯ КЛИЕНТОВ
            $table->text('warnings')->nullable(); // ПРЕДУПРЕЖДЕНИЯ
            $table->boolean('eco_friendly')->default(false); // ЭКО-ДРУЖЕЛЮБНЫЙ
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('product_details');
    }
};
