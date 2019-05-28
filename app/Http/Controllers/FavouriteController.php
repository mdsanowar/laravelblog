<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; 
use Brian2694\Toastr\Facades\Toastr;

class FavouriteController extends Controller
{
    public function Add($post)
    {
    	$user = Auth::user();
    	$isfavourite = $user->favourite_posts()->where('post_id',$post)->count();

    	if ($isfavourite == 0) {
    		$user->favourite_posts()->attach($post);
    		Toastr::success('Post Successfully added to your favourite list :)','Success');
        	return redirect()->back();
    	}else{
    		$user->favourite_posts()->detach($post);
    		Toastr::success('Post Successfully removed from your favourite list :)','Success');
        	return redirect()->back();
    	}
    }
}
