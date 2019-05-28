@extends('layouts.backend.app')
@section('title', 'Post')

@push('css')
	<link href="{{asset('public/assets/backend/plugins/jquery-datatable/skin/bootstrap/css/dataTables.bootstrap.css')}}" rel="stylesheet">
@endpush

@section('content')
<div class="container-fluid">

    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        All POST COMMENTS
                         <span class="badge bg-blue text-white">{{ $comments->count()}}</span>
                    </h2>
                    
                </div>
                <div class="body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover dataTable js-exportable">
                            <thead>
                                <tr>
                                    <th class="text-center">Comment info</th>
                                    <th class="text-center">Post info</th>
                                    <th class="text-center">Author</th>
                                   
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th class="text-center">Comment info</th>
                                    <th class="text-center">Post info</th>
                                    <th class="text-center">Author</th>
                                    
                                </tr>
                            </tfoot>
                            <tbody>

                                @foreach ($comments as $key=>$comment)
                                <tr>
									<td>
										<div class="media">
											<div class="media-left">
												<img class="media-object" src="{{url('public/storage/profile/'.$comment->user->image)}}" alt="{{$comment->user->name}}" width="64" height="64">
											</div>
											<div class="media-body">
												<h4 class="media-heading">{{$comment->user->name}} <small>{{$comment->created_at->diffForHumans()}}</small></h4>
												<p>{{$comment->comment}}</p>
												<a target="blank" href="{{ route('post.details',$comment->post->slug.'#comments') }}">Reply</a>
											</div>
										</div>
									</td>

									<td>
										<div class="media">
											<div class="media-right">
												<a target="blank" href="{{ route('post.details',$comment->post->slug)}}"></a>

												<img class="media-object" src="{{url('public/storage/post/'.$comment->post->image)}}" alt="blog-image" width="64" height="64">
											</div>
											<div class="media-body">
												<a target="blank" href="{{ route('post.details',$comment->post->slug)}}"></a>

												<h4 class="media-heading">{{str_limit($comment->post->title,'40')}}</h4>
												<p>By <strong>{{$comment->post->user->name}}</strong></p>
											</div>
										</div>
									</td>

									<td>
										<button type="button" onclick="deleteComment({{$comment->id}})" class="btn btn-danger btn-sm waves-effect">
                                            <i class="material-icons">delete</i>
                                        </button type="button">
                                        <form id="delete-form-{{$comment->id}}" action="{{ route('admin.comment.destroy',$comment->id) }}" method="post" style="display: none">
                                            @csrf
                                            @method('DELETE')
                                        </form>
									</td>
                                </tr>
                                @endforeach
 
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
 <!-- Jquery DataTable Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/jquery.dataTables.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/skin/bootstrap/js/dataTables.bootstrap.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/buttons.flash.min.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/jszip.min.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/pdfmake.min.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/vfs_fonts.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/buttons.html5.min.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/jquery-datatable/extensions/export/buttons.print.min.js')}}"></script>

    <!-- Custom Js -->
    <script src="{{asset('public/assets/backend/js/admin.js')}}"></script>
    <script src="{{asset('public/assets/backend/js/pages/tables/jquery-datatable.js')}}"></script>

    <script type="text/javascript">
        function deleteComment($id){
            const swalWithBootstrapButtons = Swal.mixin({
              customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
              },
              buttonsStyling: false,
            })

            swalWithBootstrapButtons.fire({
              title: 'Are you sure?',
              text: "You won't be able to revert this!",
              type: 'warning',
              showCancelButton: true,
              confirmButtonText: 'Yes, delete it!',
              cancelButtonText: 'No, cancel!',
              reverseButtons: true
            }).then((result) => {
              if (result.value) {
                event.preventDefault();
                document.getElementById('delete-form-'+$id).submit();
              } else if (
                // Read more about handling dismissals
                result.dismiss === Swal.DismissReason.cancel
              ) {
                swalWithBootstrapButtons.fire(
                  'Cancelled',
                  'Your imaginary file is safe :)',
                  'error'
                )
              }
            })
        }


    </script>
@endpush