<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AtmosController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\AttributesController;
use App\Http\Controllers\SpecificationController;


Route::prefix('admin')->group(function () {
    Route::prefix('products')->group(function () {
        Route::get('/', [ProductController::class, 'index'])->name('products.index');
        Route::get('/create', [ProductController::class, 'create'])->name('products.create');
        Route::post('/store', [ProductController::class, 'store'])->name('products.store');
        Route::get('/edit/{id}', [ProductController::class, 'edit'])->name('products.edit');
        Route::put('/update/{id}', [ProductController::class, 'update'])->name('products.update');
        Route::get('/destroy/{id}', [ProductController::class, 'destroy'])->name('products.delete');
    });
    Route::prefix('categories')->group(function () {
       Route::get('/', [CategoryController::class, 'index'])->name('categories.index');
       Route::get('/create', [CategoryController::class, 'create'])->name('categories.create');
       Route::post('/store', [CategoryController::class, 'store'])->name('categories.store');
       Route::get('/edit/{id}', [CategoryController::class, 'edit'])->name('categories.edit');
       Route::put('/update/{id}', [CategoryController::class, 'update'])->name('categories.update');
       Route::delete('/delete/{id}', [CategoryController::class, 'destroy'])->name('categories.delete');
    });
    Route::prefix('attributes')->group(function () {
        Route::get('/', [AttributesController::class, 'index'])->name('attributes.index');
        Route::get('/create', [AttributesController::class, 'create'])->name('attributes.create');
        Route::post('/store', [AttributesController::class, 'store'])->name('attributes.store');
        Route::get('/edit/{id}', [AttributesController::class, 'edit'])->name('attributes.edit');
        Route::put('/update/{id}', [AttributesController::class, 'update'])->name('attributes.update');
        Route::delete('/delete/{id}', [AttributesController::class, 'destroy'])->name('attributes.delete');
    });
    Route::prefix('specifications')->group(function () {
        Route::get('/', [SpecificationController::class, 'index'])->name('specifications.index');
        Route::get('/create', [SpecificationController::class, 'create'])->name('specifications.create');
        Route::post('/store', [SpecificationController::class, 'store'])->name('specifications.store');
        Route::get('/edit/{id}', [SpecificationController::class, 'edit'])->name('specifications.edit');
        Route::put('/update/{id}', [SpecificationController::class, 'update'])->name('specifications.update');
        Route::delete('/delete/{id}', [SpecificationController::class, 'destroy'])->name('specifications.delete');
    });
});

Route::get('/', [AtmosController::class, 'test'])->name('test');