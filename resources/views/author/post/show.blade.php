@extends('layouts.backend.app')
@section('title', 'Post')

@push('css')

@endpush

@section('content')
<div class="container-fluid">
	<!-- Vertical Layout | With Floating Label -->
	<a href="{{ route('author.post.index') }}" class="btn btn-danger">Back</a>
	@if ($post->is_approved == false)

		<button type="button" class="btn btn-danger waves-effect pull-right">
			<i class="material-icons">done</i>
			<span>Pending</span>
		</button>
	@else
		<button type="button" class="btn btn-success pull-right" disabled>
			<i class="material-icons">done</i>
			<span>Approved</span>
		</button>
	@endif
	<br><br>

	<div class="row clearfix">
		<div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>{{ $post->title}}</h2>
					<small>Posted by <strong><a href="#">{{ $post->user->name }}</a></strong> On {{ $post->created_at->toFormattedDateString()}}</small>
				</div>
				<div class="body">		
					{!! $post->body !!}
				</div>
			</div>
		</div>
		<div class="col-lg-4 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header bg-cyan">
					<h2>
						Categories
					</h2>
				</div>
				<div class="body">
					@foreach ($post->categories as $category)
						<span class="label bg-cyan">{{ $category->name}}</span>
					@endforeach
				</div>
			</div>

			<div class="card">
				<div class="header bg-green">
					<h2>
						Tags
					</h2>
				</div>
				<div class="body">
					@foreach ($post->tags as $tag)
						<span class="label bg-green">{{ $tag->name}}</span>
					@endforeach
				</div>
			</div>

			<div class="card">
				<div class="header bg-amber">
					<h2>
						Feature Image
					</h2>
				</div>
				<div class="body">
					<img class="img-responsive thumbnail" src="{{url('public/storage/post/'.$post->image)}}" alt="image">
				</div>
			</div>

		</div>
    </div>
</div>
@endsection

@push('js')

@endpush