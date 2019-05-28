<?php

namespace App\Http\Controllers;
use App\Category;
use App\Tag;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function PostBycategory($slug)
    {
    	$category = Category::where('slug',$slug)->first();
        $posts = $category->posts()->approved()->publish()->get();
    	return view('category_post',compact('category', 'posts'));
    }

    public function PostByTag($slug)
    {
    	$tag = Tag::where('slug', $slug)->first();
        $posts = $tag->posts()->approved()->publish()->get();
    	return view('tag', compact('tag', 'posts'));
    }
}
