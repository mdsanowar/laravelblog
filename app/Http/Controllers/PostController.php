<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;
use Illuminate\Support\Facades\Session;

class PostController extends Controller
{

	public function index()
	{
		$posts = Post::latest()->approved()->publish()->paginate(6);
		return view('posts', compact('posts'));
	}

    public function PostDetails($slug)
    {
    	$post = Post::where('slug', $slug)->approved()->publish()->first();

    	$blogtkey = 'blog_'.$post->id;
    	if (!Session::has($blogtkey)) {
    		$post->increment('view_count');
    		Session::put($blogtkey,1);
    	}

    	$randoms = Post::approved()->publish()->take(3)->inRandomOrder()->get();

    	return view('post', compact('post', 'randoms'));
    }


}
