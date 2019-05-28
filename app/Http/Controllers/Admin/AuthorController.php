<?php

namespace App\Http\Controllers\Admin;
use APP\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;

class AuthorController extends Controller
{
    public function index()
    {
    	$authors = User::authors()
    		->withCount('posts')
    		->withCount('favourite_posts')
    		->withCount('comments')
    		->get();

    	return view('admin.authors', compact('authors'));
    }

    public function destroy($id)
    {
    	$author = User::findorfail($id);
    	$author->delete();
    	Toastr::success('Author Deleted Successfully :)','Success');
    	return Redirect()->back();

    }
}
