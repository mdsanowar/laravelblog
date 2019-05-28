@extends('layouts.frontend.app')
@section('title', 'Profile')

@push('css')
<link href="{{asset('public\assets\frontend\css\category-sidebar/styles.css')}}" rel="stylesheet">

<link href="{{asset('public\assets\frontend\css\category-sidebar/responsive.css')}}" rel="stylesheet">
<style>

	.favourite_post{
		color: #cf000f;
	}
</style>
@endpush

@section('content')

<div class="slider display-table center-text">
	<h1 class="title display-table-cell"><b>{{$author->name}}</b></h1>
</div><!-- slider -->

<section class="blog-area section">
	<div class="container">

		<div class="row">

			<div class="col-lg-8 col-md-12">
				<div class="row">
					@if ($posts->count() > 0)
					@foreach ($posts as $post)

					<div class="col-md-6 col-sm-12">
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
											<li><a href="#"><i class="ion-chatbubble"></i>6</a></li>
											<li><a href="#"><i class="ion-eye"></i>{{ $post->view_count }}</a></li>
										</ul>

									</div><!-- blog-info -->
								</div><!-- single-post -->

							</div><!-- card -->
						</div><!-- col-md-6 col-sm-12 -->
						@endforeach
						@else{
						<div class="col-lg-12 col-md-12 ">

							<div class="single-post info-area ">

								<div class="about-area">
									<p>Author dose not have any post</p>
								</div>

							</div><!-- info-area -->

						</div><!-- col-lg-4 col-md-12 -->
					}
					@endif
					
				</div><!-- row -->

			</div><!-- col-lg-8 col-md-12 -->

			<div class="col-lg-4 col-md-12 ">

				<div class="single-post info-area ">

					<div class="about-area">
						<h4 class="title"><b>ABOUT AUTHOR</b></h4>
						<p>{{ $author->name}}</p><br>
						<p>{{$post->user->about}}</p><br>
						<strong>Author Since : {{$author->created_at->toDateString()}}</strong><br>
						<strong>Total Post : {{$author->posts->count()}}</strong>
					</div>

				</div><!-- info-area -->

			</div><!-- col-lg-4 col-md-12 -->

		</div><!-- row -->

	</div><!-- container -->
</section><!-- section -->

@endsection
@push('js')

@endpush