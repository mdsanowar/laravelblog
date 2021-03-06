@extends('layouts.backend.app')
@section('title', 'Setting')

@push('css')

@endpush

@section('content')
<div class="container-fluid">
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>
						SETTINGS
					</h2>
				</div>
				<div class="body">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">

						<li role="presentation" class="active">
                            <a href="#profile_with_icon_title" data-toggle="tab">
                                <i class="material-icons">face</i> UPDATE PROFILE
                            </a>
                        </li>

						<li role="presentation">
							<a href="#change_password_with_icon_title" data-toggle="tab">
								<i class="material-icons">change_history</i> CHANGE PASSWORD
							</a>
						</li>
					</ul>

					<!-- Tab panes -->
					<div class="tab-content">

						<div role="tabpanel" class="tab-pane fade in active" id="profile_with_icon_title">
							<div class="row clearfix">
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
									<div class="card">
										<div class="header">
											<h2>
												UPDATE PROFILE
											</h2>
										</div>
										<div class="body">
											<form action="{{ route('admin.update.profile') }}" class="form-horizontal" method="POST" enctype="multipart/form-data">
												@csrf
												@method('PUT')

												<div class="row clearfix">
													<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
														<label for="name">Name : </label>
													</div>
													<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
														<div class="form-group">
															<div class="form-line">
																<input type="text" id="name" name="name" class="form-control" value="{{ Auth::user()->name}}">
															</div>
														</div>
													</div>
												</div>

												<div class="row clearfix">
													<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
														<label for="email">Email : </label>
													</div>
													<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
														<div class="form-group">
															<div class="form-line">
																<input type="email" id="email" name="email" class="form-control" value="{{ Auth::user()->email}}">
															</div>
														</div>
													</div>
												</div>

												<div class="row clearfix">
													<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
														<label for="image">Profile Image : </label>
													</div>
													<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
														<div class="form-group">
															<div class="">
																<input type="file" name="image" value="{{ Auth::user()->email}}">
															</div>
														</div>
													</div>
												</div>

												<div class="row clearfix">
													<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
														<label for="about">About : </label>
													</div>
													<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
														<div class="form-group">
															<div class="form-line">
																<textarea name="about" class="form-control" id="about" cols="30" rows="5">{{ Auth::user()->about}}</textarea>
															</div>
														</div>
													</div>
												</div>

												<div class="row clearfix">
													<div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
														<button type="submit" class="btn btn-primary m-t-15 waves-effect">Update</button>
													</div>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane fade" id="change_password_with_icon_title">
							<form action="{{ route('admin.update.password') }}" class="form-horizontal" method="POST">
								@csrf
								@method('PUT')

								<div class="row clearfix">
									<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
										<label for="old_password">Old Password : </label>
									</div>
									<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
										<div class="form-group">
											<div class="form-line">
												<input type="password" id="old_password" name="old_password" class="form-control" placeholder="Enter Old password">
											</div>
										</div>
									</div>
								</div>

								<div class="row clearfix">
									<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
										<label for="password">New Password : </label>
									</div>
									<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
										<div class="form-group">
											<div class="form-line">
												<input type="password" id="password" name="password" class="form-control" placeholder="Enter new password">
											</div>
										</div>
									</div>
								</div>

								<div class="row clearfix">
									<div class="col-lg-2 col-md-2 col-sm-4 col-xs-5 form-control-label">
										<label for="password">Confirm Password : </label>
									</div>
									<div class="col-lg-10 col-md-10 col-sm-8 col-xs-7">
										<div class="form-group">
											<div class="form-line">
												<input type="password" id="password_confirmation" name="password_confirmation" class="form-control" placeholder="Enter new password">
											</div>
										</div>
									</div>
								</div>

								<div class="row clearfix">
									<div class="col-lg-offset-2 col-md-offset-2 col-sm-offset-4 col-xs-offset-5">
										<button type="submit" class="btn btn-primary m-t-15 waves-effect">Password Update</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection

@push('js')

@endpush