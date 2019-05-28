@extends('layouts.frontend.app')
@section('title', 'Posts')

@push('css')
	<link href="{{asset('public/assets/frontend/css/posts/styles.css')}}" rel="stylesheet">

	<link href="{{asset('public/assets/frontend/css/posts/responsive.css')}}" rel="stylesheet">
	<style>

        .favourite_post{
            color: #cf000f;
        }
    </style>
@endpush

@section('content')
	<div class="slider display-table center-text">
		<h1 class="title display-table-cell"><b>ALL POSTS</b></h1>
	</div><!-- slider -->

	<section class="blog-area section">
        <div class="container">

            <div class="row">
                @foreach ($posts as $post)
                    <div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="single-post post-style-1">

                            <div class="blog-image">
                                <a href="{{ route('post.details',$post->slug) }}"><img src="{{url('public/storage/post/'.$post->image)}}" alt="{{ $post->title }}"></a>
                            </div>

                            <a class="avatar" href="{{ route('author.profile',$post->user->user_name) }}"><img src="{{url('public/storage/profile/'.$post->user->image)}}" alt="Profile Image"></a>

                            <div class="blog-info">

                                <h4 class="title"><a href="{{ route('post.details',$post->slug) }}"><b>{{ $post->title }}</b></a></h4>

                                <ul class="post-footer">
                                    <li>

                                    @guest
                                    <a href="javascript:void(0);" onclick="Toastr.info('To add favourite list. You need to login first.','Info',{

                                        closeButton:true,

                                        progressBar:true,

                                    })"><i class="ion-heart"></i>{{$post->favourite_to_users->count()}}</a>
                                    @else
                                    <a href="javascript:void(0);" onclick="document.getElementById('favourite-form-{{$post->id}}').submit();"

                                        class="{{!Auth::user()->favourite_posts->where('pivot.post_id',$post->id)->count() == 0 ? 'favourite_post' : ''}}" 
                                        ><i class="ion-heart"></i>{{$post->favourite_to_users->count()}}</a>

                                    <form id="favourite-form-{{$post->id}}" method="POST" action="{{ route('post.favourite',$post->id) }}">

                                        @csrf
                                        
                                    </form>
                                    @endguest
                                        
                                    </li>
                                    <li>
                                        <a href="#"><i class="ion-chatbubble"></i>{{$post->comments->count()}}</a>
                                    </li>
                                    <li><a href="#"><i class="ion-eye"></i>{{ $post->view_count }}</a></li>
                                </ul>

                            </div><!-- blog-info -->
                        </div><!-- single-post -->
                    </div><!-- card -->
                </div><!-- col-lg-4 col-md-6 -->
                @endforeach
            </div><!-- row -->

            {{ $posts->links() }}

        </div><!-- container -->
    </section><!-- section -->

@endsection

@push('js')

@endpush