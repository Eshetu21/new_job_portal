<?php

namespace App\Http\Requests\AuthenticationRequest;

use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            "firstname"=>"required|string",
            "lastname"=>"required|string",
            "email"=>"required|email|unique:users",
            "password"=>"required|string|min:6"
        ];
    }
}
