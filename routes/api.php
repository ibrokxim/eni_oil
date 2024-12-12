<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AtmosController;

Route::post('/atmos-token', [AtmosController::class, 'getToken']);
Route::get('/', [AtmosController::class, 'test'])->name('test');
