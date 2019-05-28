@extends('layouts.backend.app')
@section('title','Dashboard')

@push('css')

@endpush

@section('content')
<div class="container-fluid">
            <div class="block-header">
                <h2>DASHBOARD</h2>
            </div>

            <!-- Widgets -->
            <div class="row clearfix">
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-green hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">playlist_add_check</i>
                        </div>
                        <div class="content">
                            <div class="text">TOTAL POST</div>
                            <div class="number count-to" data-from="0" data-to="{{$posts->count()}}" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-cyan hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">favorite</i>
                        </div>
                        <div class="content">
                            <div class="text">FAVORITE POSTS</div>
                            <div class="number count-to" data-from="0" data-to="{{Auth::user()->favourite_posts()->count()}}" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-red hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">library_books</i>
                        </div>
                        <div class="content">
                            <div class="text">PENDING POSTS</div>
                            <div class="number count-to" data-from="0" data-to="{{$total_pending_posts}}" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="info-box bg-orange hover-expand-effect">
                        <div class="icon">
                            <i class="material-icons">person_add</i>
                        </div>
                        <div class="content">
                            <div class="text">TOTAL VIEW</div>
                            <div class="number count-to" data-from="0" data-to="{{$all_posts}}" data-speed="1000" data-fresh-interval="20"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Widgets -->

            <div class="row clearfix">
                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                    <div class="info-box bg-pink hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">apps</i>
                        </div>
                        <div class="content">
                            <div class="text">CATEGORIES</div>
                            <div class="number count-to" data-from="0" data-to="{{$category_count}}" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
               

                
                    <div class="info-box bg-pink hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">labels</i>
                        </div>
                        <div class="content">
                            <div class="text">TAGS</div>
                            <div class="number count-to" data-from="0" data-to="{{$tag_count}}" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>

                    <div class="info-box bg-deep-purple hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">account_circle</i>
                        </div>
                        <div class="content">
                            <div class="text">TOTAL AUTHOR</div>
                            <div class="number count-to" data-from="0" data-to="{{$author_count}}" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div>
                       
                    <div class="info-box bg-purple hover-zoom-effect">
                        <div class="icon">
                            <i class="material-icons">fiber_new</i>
                        </div>
                        <div class="content">
                            <div class="text">TODAY AUTHOR</div>
                            <div class="number count-to" data-from="0" data-to="{{$new_author_today}}" data-speed="15" data-fresh-interval="20"></div>
                        </div>
                    </div> 

                 </div>

                <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>POPULAR POSTS</h2>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Rank</th>
                                            <th>Title</th>
                                            <th>Author</th>
                                            <th>Views</th>
                                            <th>Favorite</th>
                                            <th>Comment</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($popular_posts as $key=>$post)
                                        <tr>
                                            <td>{{$key + 1}}</td>
                                            <td>{{str_limit($post->title, '20')}}</td>
                                            <td>{{$post->user->name}}</td>
                                            <td>{{$post->view_count}}</td>
                                            <td>{{$post->favourite_to_users_count}}</td>
                                            <td>{{$post->comments_count}}</td>
                                            <td>
                                                @if ($post->status == true)
                                                    <span class="label bg-green">Publish</span>
                                                @else
                                                    <span class="label bg-red">Pending</span>
                                                @endif
                                            </td>
                                            <td>
                                                <a class="btn btn-sm btn-primary waves-effect" target="blank" href="{{ route('post.details',$post->slug) }}">View</a>
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
            <!-- #END# Widgets -->

            <div class="row clearfix">
                <!-- Task Info -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="header">
                            <h2>TOP TEN ACTIVE AUTHOR</h2>
                        </div>
                        <div class="body">
                            <div class="table-responsive">
                                <table class="table table-hover dashboard-task-infos">
                                    <thead>
                                        <tr>
                                            <th>Ramk list</th>
                                            <th>Name</th>
                                            <th>Post</th>
                                            <th>Comment</th>
                                            <th>Favorite</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       @foreach ($active_author as $key=>$author)
                                           <tr>
                                            <td>{{$key + 1}}</td>
                                            <td>{{$author->name}}</td>
                                            <td>{{$author->posts_count}}</td>
                                            <td>{{$author->comments_count}}</td>
                                            <td>{{$author->favourite_posts_count}}</td>

                                        </tr>
                                        @endforeach 
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- #END# Task Info -->

            </div>
        </div>
@endsection

@push('js')
<!-- Jquery CountTo Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/jquery-countto/jquery.countTo.js')}}"></script>

    <!-- Morris Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/raphael/raphael.min.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/morrisjs/morris.js')}}"></script>

    <!-- ChartJs -->
    <script src="{{asset('public/assets/backend/plugins/chartjs/Chart.bundle.js')}}"></script>

    <!-- Flot Charts Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/flot-charts/jquery.flot.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/flot-charts/jquery.flot.resize.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/flot-charts/jquery.flot.pie.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/flot-charts/jquery.flot.categories.js')}}"></script>
    <script src="{{asset('public/assets/backend/plugins/flot-charts/jquery.flot.time.js')}}"></script>

    <!-- Sparkline Chart Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/jquery-sparkline/jquery.sparkline.js')}}"></script>


    <script src="{{asset('public/assets/backend/js/pages/index.js')}}"></script>
@endpush
