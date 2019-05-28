@extends('layouts.backend.app')
@section('title', 'Category')

@push('css')
<link href="{{asset('public/assets/backend/plugins/sweetalert/sweetalert.css')}}" rel="stylesheet" />
@endpush

@section('content')
<div class="container-fluid">
	<!-- Vertical Layout | With Floating Label -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header bg-info">
					<h2>
						EDIT CATEGORY
					</h2>
				</div>
				<div class="body">
					<form action="{{ route('admin.category.update',$category->id) }}" method="post" enctype="multipart/form-data">
						@csrf
						@method('PUT')
						<div class="form-group form-float">
							<div class="form-line">
								<input type="text" id="name" class="form-control" name="name" value="{{$category->name}}">
								<label class="form-label">Category Name</label>
							</div>
						</div>

						<div class="form-group form-float">
							<div class="form-line">
								<img id="image" src="#">
								<input type="file" name="image" class="form-control upload" accept="image*/" onchange="readURL(this);">
							</div>
						</div>

						<br>
						<a href="{{route('admin.category.index')}}" class="btn btn-danger m-t-15 waves-effect">BACK</a>
						<button type="submit" class="btn btn-primary m-t-15 waves-effect">SUBMIT</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Vertical Layout | With Floating Label -->

</div>
@endsection

@push('js')
  <!--Show old image-->
    <script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#image')
                    .attr('src', e.target.result)
                    .width(80)
                    .height(80);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
@endpush