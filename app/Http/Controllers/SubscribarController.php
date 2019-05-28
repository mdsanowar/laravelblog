<?php

namespace App\Http\Controllers;
use App\Subscribar;
use Illuminate\Http\Request;
use Brian2694\Toastr\Facades\Toastr;

class SubscribarController extends Controller
{
    public function store(Request $request)
    {
    	$validatedData = $request->validate([
        	'email' => 'required|email|unique:subscribars',
    	]);

    	$subscribar = new Subscribar();
    	$subscribar->email = $request->email;
    	$subscribar->save();

    	Toastr::success('Email subscribes successfully :)','Success');
        return redirect()->back();
    }
}
