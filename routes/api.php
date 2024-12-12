<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RequestController;

Route::post('/footerform', [RequestController::class, 'sendRequestToTelegram']);
Route::post('/contactform', [RequestController::class, 'callRequestToTelegram']);
Route::post('/modalform', [RequestController::class, 'contactRequestToTelegram']);
