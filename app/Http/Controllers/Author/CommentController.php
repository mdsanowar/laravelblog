<?php

namespace App\Http\Controllers\Author;
use App\Comment;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Auth;


class CommentController extends Controller
{
    public function index()
    {
    	$comments = Auth::user()->comments;
    	return view('author.comments', compact('comments'));
    }

    public function destroy($id)
    {
    	
    	$comment = Comment::findorfail($id);

    	if ($comment->post->user->id == Auth::id()) {
    		$comment->delete();
    		Toastr::success('Comment Deleted Successfully :)','Success');
    	}else{
    		Toastr::error('You are not authoraized to delete this comment :(','Access Denied !!!');
    	}
    	
        return redirect()->back();
    }
}
