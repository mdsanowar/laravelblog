<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Post;
use App\User;
use Carbon\Carbon;
use App\Category;
use App\Tag;

class DashboardController extends Controller
{
    public function index()
    {
    	$posts = Post::all();
    	$popular_posts = Post::withCount('comments')
    					->withCount('favourite_to_users')
    					->orderBy('view_count', 'desc')
    					->orderBy('comments_count', 'desc')
    					->orderBy('favourite_to_users_count')
    					->take(5)->get();
    	$total_pending_posts = Post::where('is_approved', false)->count();
    	$all_posts = Post::sum('view_count');
    	$author_count = User::where('role_id', 2)->count();
    	$new_author_today = User::where('role_id', 2)
    					->whereDate('created_at', Carbon::today())->count();
    	$active_author = User::where('role_id', 2)
    					->withCount('posts')
    					->withCount('comments')
    					->withCount('favourite_posts')
    					->orderBy('posts_count')
    					->orderBy('comments_count')
    					->orderBy('favourite_posts_count')
    					->take(10)
    					->get();
    	$category_count = Category::all()->count();
    	$tag_count = Tag::all()->count();
    	return view('admin.dashboard',compact('posts','popular_posts','total_pending_posts','all_posts','author_count','new_author_today','active_author','category_count','tag_count'));
    }
}
