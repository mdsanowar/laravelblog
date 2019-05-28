<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Post;

class SearchController extends Controller
{
    public function search(Request $request)
    {
    	$this->validate($request, [
            'query' => 'required'
        ]);
        $query = $request->input('query');
        $posts= Post::where('title','LIKE',"%$query%")->approved()->publish()->get();
        return view('search', compact('posts', 'query'));
        
    }
}
