<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RequestController;
use App\Http\Controllers\Pages\FooterController;
use App\Http\Controllers\Pages\MainPageController;
use App\Http\Controllers\Pages\AboutPageController;

Route::post('/footerform', [RequestController::class, 'sendRequestToTelegram']);
Route::post('/modalform ', [RequestController::class, 'callRequestToTelegram']);
Route::post('/contactform', [RequestController::class, 'contactRequestToTelegram']);

Route::get('/get-main', [MainPageController::class, 'apiResponse']);
Route::get('/get-footer', [FooterController::class, 'apiResponse']);
Route::get('/get-about', [AboutPageController::class, 'apiResponse']);
