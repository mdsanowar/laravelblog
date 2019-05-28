@extends('layouts.frontend.app')
@section('title')
{{ $post->title }}
@endsection

@push('css')
	<link href="{{asset('public\assets\frontend\css\single-post/styles.css')}}" rel="stylesheet">

	<link href="{{asset('public\assets\frontend\css\single-post/responsive.css')}}" rel="stylesheet">

	<style>
		.header-bg{
			height: 400px;
			width: 100%;
			background-image: url({{url('public/storage/post/'.$post->image)}}); 
			background-size: cover; 
		}
        .favourite_post{
            color: #cf000f;
        }
    </style>
@endpush

@section('content')
	<div class="header-bg">
		<div class="display-table  center-text">
			<h1 class="title display-table-cell"><b></b></h1>
		</div>
	</div><!-- slider -->

	<section class="post-area section">
		<div class="container">

			<div class="row">

				<div class="col-lg-8 col-md-12 no-right-padding">

					<div class="main-post">

						<div class="blog-post-inner">

							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="{{url('public/storage/profile/'.$post->user->image)}}" alt="{{$post->user->name}}"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>{{$post->user->name}}</b></a>
									<h6 class="date">{{$post->created_at->diffForHumans()}}</h6>
								</div>

							</div><!-- post-info -->

							<h3 class="title"><a href="#"><b>{{$post->title}}</b></a></h3>

							<div class="para">
								{!! html_entity_decode($post->body) !!}
							</div>

							<ul class="tags">
								@foreach ($post->tags as $tag)
									<li><a href="{{ route('tag.posts',$tag->slug) }}">{{$tag->name}}</a></li>
								@endforeach

							</ul>
						</div><!-- blog-post-inner -->

						<div class="post-icons-area">
							<ul class="post-icons">
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

							<ul class="icons">
								<li>SHARE : </li>
								<li><a href="#"><i class="ion-social-facebook"></i></a></li>
								<li><a href="#"><i class="ion-social-twitter"></i></a></li>
								<li><a href="#"><i class="ion-social-pinterest"></i></a></li>
							</ul>
						</div>


					</div><!-- main-post -->
				</div><!-- col-lg-8 col-md-12 -->

				<div class="col-lg-4 col-md-12 no-left-padding">

					<div class="single-post info-area">

						<div class="sidebar-area about-area">
							<h4 class="title"><b>ABOUT AUTHOR</b></h4>
							<p>{{$post->user->about}}</p>
						</div>

						<div class="sidebar-area subscribe-area">

							<h4 class="title"><b>SUBSCRIBE</b></h4>
							<div class="input-area">
								<form action="{{ route('subscribar.store') }}" method="post">
									@csrf
									<input class="email-input" type="text" placeholder="Enter your email">
									<button class="submit-btn" type="submit"><i class="icon ion-ios-email-outline"></i></button>
								</form>
							</div>

						</div><!-- subscribe-area -->

						<div class="tag-area">

							<h4 class="title"><b>CATEGORY CLOUD</b></h4>
							<ul>
								@foreach ($post->categories as $category)
									<li><a href="{{ route('category.posts',$category->slug) }}">{{ $category->name }}</a></li>
								@endforeach
							</ul>

						</div><!-- subscribe-area -->

					</div><!-- info-area -->

				</div><!-- col-lg-4 col-md-12 -->

			</div><!-- row -->

		</div><!-- container -->
	</section><!-- post-area -->


	<section class="recomended-area section">
		<div class="container">
			<div class="row">
				@foreach ($randoms as $random)
				
				<div class="col-lg-4 col-md-6">
                    <div class="card h-100">
                        <div class="single-post post-style-1">

                            <div class="blog-image">
                                <a href="{{ route('post.details',$random->slug) }}"><img src="{{url('public/storage/post/'.$random->image)}}" alt="{{ $random->title }}"></a>
                            </div>

                            <a class="avatar" href="#"><img src="{{url('public/storage/profile/'.$random->user->image)}}" alt="{{ $random->user->name }}"></a>

                            <div class="blog-info">

                                <h4 class="title"><a href="{{ route('post.details',$random->slug) }}"><b>{{ $random->title }}</b></a></h4>

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

                                    <form id="favourite-form-{{$random->id}}" method="POST" action="{{ route('post.favourite',$random->id) }}">

                                        @csrf
                                        
                                    </form>
                                    @endguest
                                        
                                    </li>
                                    <li><a href="#"><i class="ion-chatbubble"></i>{{$random->comments->count()}}</a></li>
                                    <li><a href="#"><i class="ion-eye"></i>{{ $random->view_count }}</a></li>
                                </ul>

                            </div><!-- blog-info -->
                        </div><!-- single-post -->
                    </div><!-- card -->
                </div><!-- col-lg-4 col-md-6 -->

				@endforeach
			</div><!-- row -->

		</div><!-- container -->
	</section>

	<section class="comment-section">
		<div class="container">
			<h4><b>POST COMMENT</b></h4>
			<div class="row">

				<div class="col-lg-8 col-md-12">
					<div class="comment-form">
						@guest
							<p>For post a new comment. You need to login first <a href="{{ route('login') }}"><b style="color: blue">Login</b></a></p>
						@else
						<form method="post" action="{{ route('comment.store', $post->id) }}">
							@csrf
							
							<div class="row">
				
								<div class="col-sm-12">
									<textarea name="comment" rows="2" class="text-area-messge form-control"
										placeholder="Enter your comment" aria-required="true" aria-invalid="false"></textarea >
								</div><!-- col-sm-12 -->
								<div class="col-sm-12">
									<button class="submit-btn" type="submit" id="form-submit"><b>POST COMMENT</b></button>
								</div><!-- col-sm-12 -->

							</div><!-- row -->
						</form>
						@endguest
					</div><!-- comment-form -->

					<h4><b>COMMENTS ({{$post->comments->count()}})</b></h4>

					{{-- <div class="commnets-area">

						<div class="comment">

							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>Katy Liu</b></a>
									<h6 class="date">on Sep 29, 2017 at 9:48 am</h6>
								</div>

								<div class="right-area">
									<h5 class="reply-btn" ><a href="#"><b>REPLY</b></a></h5>
								</div>

							</div><!-- post-info -->

							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur
								Ut enim ad minim veniam</p>

						</div>

						<div class="comment">
							<h5 class="reply-for">Reply for <a href="#"><b>Katy Lui</b></a></h5>

							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="images/avatar-1-120x120.jpg" alt="Profile Image"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>Katy Liu</b></a>
									<h6 class="date">on Sep 29, 2017 at 9:48 am</h6>
								</div>

								<div class="right-area">
									<h5 class="reply-btn" ><a href="#"><b>REPLY</b></a></h5>
								</div>

							</div><!-- post-info -->

							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur
								Ut enim ad minim veniam</p>

						</div>

					</div> --}}<!-- commnets-area -->

				@if ($post->comments->count() > 0 )
					@foreach ($post->comments as $comment)
					<div class="commnets-area">
						<div class="comment">
							
							<div class="post-info">

								<div class="left-area">
									<a class="avatar" href="#"><img src="{{url('public/storage/profile/'.$comment->user->image)}}" alt="{{$comment->user->name}}"></a>
								</div>

								<div class="middle-area">
									<a class="name" href="#"><b>{{$comment->user->name}}</b></a>
									<h6 class="date">{{$comment->created_at->diffForHumans()}}</h6>
								</div>

								<div class="right-area">
									<h5 class="reply-btn" ><a href="#"><b>REPLY</b></a></h5>
								</div>

							</div><!-- post-info -->

							<p>{{ $comment->comment }}</p>

						</div>
						
					</div><!-- commnets-area -->
				@endforeach

				@else
				<div class="commnets-area">
					<div class="comment">

						<p>No comments yet, Be the first :)</p>

					</div>
				</div>
				@endif

				</div><!-- col-lg-8 col-md-12 -->

			</div><!-- row -->

		</div><!-- container -->
	</section>
@endsection

@push('js')

@endpush