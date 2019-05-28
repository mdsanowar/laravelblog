<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;

class AuthorController extends Controller
{
    public function profile($user_name)
    {
        $author = User::where('user_name',$user_name)->first();
        $posts = $author->posts()->approved()->publish()->get();
        return view('profile',compact('author','posts'));
    }
}
