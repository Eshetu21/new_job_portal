<?php

namespace App\Http\Controllers\Authentication;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use App\Http\Requests\AuthenticationRequest\LoginRequest;
use App\Http\Requests\AuthenticationRequest\RegisterRequest;
use App\Http\Requests\AuthenticationRequest\UpdateRequest;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class AuthenticationController extends Controller
{
    public function register(RegisterRequest $request)
    {
        $validatedData = $request->validated();
        try {
            $user = User::create([
                "firstname" => $validatedData["firstname"],
                "lastname" => $validatedData["lastname"],
                "email" => $validatedData["email"],
                "password" => Hash::make($validatedData["password"])
            ]);
            $token = $user->createToken("job_portal")->plainTextToken;
            return response()->json([
                "name" => $user->firstname . " " . $user->lastname,
                "token" => $token
            ], 201);
        } catch (ValidationException $e) {
            return response()->json([
                "message" => "Validation Failed",
                "errors" => $e->errors()
            ], 422);
        }
    }

    public function login(LoginRequest $request)
    {
        $validatedData = $request->validated();
        $user = User::whereemail($request->email)->first();
        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                "error" => "Invalid Credientials"
            ], 401);
        }

        $token = $user->createToken("job_portal")->plainTextToken;
        return response()->json([
            "message" => "Welcome " . $user->firstname,
            "token" => $token
        ], 200);
    }

    public function getuser(Request $request)
    {
        return $request->user();
    }

   public function update(UpdateRequest $request)
{
    $user = $request->user();
    $validatedData = $request->validated();

    // Debugging: Check validated data
    Log::info('Update data:', $validatedData);

    // Ensure only fields with values are updated
    $user->fill($validatedData);
    $user->save();

    // Debugging: Check updated user
    Log::info('Updated user:', $user->toArray());

    return response()->json([
        "message" => "Data updated successfully",
        "user" => $user
    ], 200);
}

}
