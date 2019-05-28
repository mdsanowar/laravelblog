<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- CSRF Token -->
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<title>@yield('title') - {{ config('app.name', 'Laravel') }}</title>

	<!-- Favicon-->
    <link rel="icon" href="{{asset('public/assets/backend/favicon.ico')}}" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="{{asset('public/assets/backend/plugins/bootstrap/css/bootstrap.css')}}" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="{{asset('public/assets/backend/plugins/node-waves/waves.css')}}" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="{{asset('public/assets/backend/plugins/animate-css/animate.css')}}" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="{{asset('public/assets/backend/plugins/morrisjs/morris.css')}}" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="{{asset('public/assets/backend/css/style.css')}}" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="{{asset('public/assets/backend/css/themes/all-themes.css')}}" rel="stylesheet" />

    <link rel="stylesheet" href="{{asset('http://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css')}}">

	


	@stack('css')


</head>
<body class="theme-blue">

	<!-- Page Loader -->
    @include('layouts.backend.partial.topbar')
    <!-- #Top Bar -->
    
        <!-- Left Sidebar -->
    @include('layouts.backend.partial.sidebar')
        <!-- #END# Left Sidebar -->


    <section class="content">
        @yield('content')
    </section>


	
	<!-- Jquery Core Js -->
    <script src="{{asset('public/assets/backend/plugins/jquery/jquery.min.js')}}"></script>

    <!-- Bootstrap Core Js -->
    <script src="{{asset('public/assets/backend/plugins/bootstrap/js/bootstrap.js')}}"></script>

    <!-- Select Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/bootstrap-select/js/bootstrap-select.js')}}"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/jquery-slimscroll/jquery.slimscroll.js')}}"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="{{asset('public/assets/backend/plugins/node-waves/waves.js')}}"></script>

    <!-- Custom Js -->
    <script src="{{asset('public/assets/backend/js/admin.js')}}"></script>

    <!-- Demo Js -->
    <script src="{{asset('public/assets/backend/js/demo.js')}}"></script>

    <script src="{{asset('https://cdn.jsdelivr.net/npm/sweetalert2@8')}}"></script>
    <script src="{{asset('http://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js')}}"></script>
        {!! Toastr::message() !!}

    <script>
        @if ($errors->any())
            @foreach ($errors->all() as $error)
                toastr.error('{{$error}}','Error',{
                    closeButton:true,
                    progressBar:true,
                });
            @endforeach
        @endif
    </script>
    

    @stack('js')

</body>
</html>