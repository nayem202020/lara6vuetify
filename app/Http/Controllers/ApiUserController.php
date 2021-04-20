<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class ApiUserController extends Controller
{
    public function login(Request $request)
    {
        $creadentials=$request->only('email','password');
        if (Auth::attempt($creadentials)){
            $token= Str::random(80);
            Auth::user()->api_token =$token;
            Auth::user()->save();
            return response()->json(['token' => $token,'isAdmin' =>Auth::user()->isAdmin() ],200);
        }
        return response()->json(['status'=>'Email or Password wrong'],403);

    }

    public function verify(Request $request)
    {
        return $request->user()->only('name','email');
    }
}
