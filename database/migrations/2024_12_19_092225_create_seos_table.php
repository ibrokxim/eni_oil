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
        Schema::create('seos', function (Blueprint $table) {
            $table->id();
            $table->string('slug')->unique();
            $table->string('title')->nullable();
            $table->text('description')->nullable();
            $table->string('keywords')->nullable();
            $table->string('position'); // header or footer
            $table->string('type'); // product, category, or global
            $table->unsignedBigInteger('type_id')->nullable(); // ID of the product or category
            $table->timestamps();

            $table->index(['type', 'type_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('seos');
    }
};
