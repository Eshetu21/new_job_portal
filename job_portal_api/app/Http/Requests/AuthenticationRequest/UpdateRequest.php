<?php

namespace App\Http\Requests\AuthenticationRequest;

use Illuminate\Foundation\Http\FormRequest;

class UpdateRequest extends FormRequest
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
            'firstname' => 'nullable|string',
            'lastname' => 'nullable|string',
            'email' => 'nullable|string|email|unique:users,email,' . $this->user()->id,
            'profile_pic' => 'nullable|string',
            'bio' => 'nullable|string',
            'cv' => 'nullable|string',
            'education_detail' => 'nullable|string',
            'experience' => 'nullable|string',
            'phone_number' => 'nullable|string',
            'address' => 'nullable|string',
        ];
    }
}
