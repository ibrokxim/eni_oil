<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RequestController;

Route::post('/footerform', [RequestController::class, 'sendRequestToTelegram']);
Route::post('/modalform ', [RequestController::class, 'callRequestToTelegram']);
Route::post('/contactform', [RequestController::class, 'contactRequestToTelegram']);
