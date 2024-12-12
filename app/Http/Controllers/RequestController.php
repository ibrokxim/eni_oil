<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class RequestController extends Controller
{
    public function sendRequestToTelegram(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'text' => 'required',
        ]);

        $name = $request->input('name');
        $email = $request->input('email');
        $text = $request->input('text');

        $token = env('TELEGRAM_BOT_TOKEN');
        $chat_id = env('TELEGRAM_CHAT_ID');

        $message = "Напишите нам и мы свяжемся с Вами!:\nИмя: $name\nEmail: $email\nТекст: $text";

        $response = Http::get("https://api.telegram.org/bot$token/sendMessage", [
            'chat_id' => $chat_id,
            'text' => $message
        ]);

        if ($response->successful()) {
            return redirect()->back()->with('success', 'Заявка успешно отправлена!');
        } else {
            Log::error('Ошибка при отправке заявки: ' . $response->body());
            return redirect()->back()->with('error', 'Ошибка при отправке заявки!');
        }
    }

    public function callRequestToTelegram(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'address' => 'required',
        ]);

        $name = $request->input('name');
        $email = $request->input('email');
        $phone = $request->input('phone');
        $address = $request->input('address');

        $token = env('TELEGRAM_BOT_TOKEN');
        $chat_id = env('TELEGRAM_CHAT_ID');

        $message = "Заказать звонок:\nНазвание компании: $name\nEmail: $email\nНомер телефона: $phone\nЮредичесмкий адрес: $address";

        $response = Http::get("https://api.telegram.org/bot$token/sendMessage", [
            'chat_id' => $chat_id,
            'text' => $message
        ]);

        if ($response->successful()) {
            return redirect()->back()->with('success', 'Заявка успешно отправлена!');
        } else {
            return redirect()->back()->with('error', 'Ошибка при отправке заявки!');
        }



    }

    public function contactRequestToTelegram(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'surname' => 'required',
            'email' => 'required',
            'phone' => 'required',

        ]);

        $name = $request->input('name');
        $surname = $request->input('surname');
        $email = $request->input('email');
        $phone = $request->input('phone');



        $token = env('TELEGRAM_BOT_TOKEN');
        $chat_id = env('TELEGRAM_CHAT_ID');

        $message = "Контактные данные для связи:\nИмя: $name\nФамилия: $surname\nEmail $email\nНомер телефона: $phone";

        $response = Http::get("https://api.telegram.org/bot$token/sendMessage", [
            'chat_id' => $chat_id,
            'text' => $message
        ]);

        if ($response->successful()) {
            return redirect()->back()->with('success', 'Заявка успешно отправлена!');
        } else {
            Log::error('Ошибка при отправке заявки: ' . $response->body());
            return redirect()->back()->with('error', 'Ошибка при отправке заявки!');
        }
    }
}
