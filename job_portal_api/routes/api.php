<?php

use App\Http\Controllers\Authentication\AuthenticationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get("test",function(){
    return response()->json([
        "message"=>"Api is working"
    ]);
});

Route::post("register",[AuthenticationController::class,"register"]);
Route::post("login",[AuthenticationController::class,"login"]);
Route::get("getuser",[AuthenticationController::class,"getuser"])->middleware("auth:sanctum");
Route::put("update",[AuthenticationController::class,"update"])->middleware("auth:sanctum");
