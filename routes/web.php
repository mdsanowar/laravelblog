<?php
Route::get('/','HomeController@index')->name('home');

Route::post('subscriber', 'SubscribarController@store')->name('subscribar.store');

Auth::routes();

//Favorite post controller ========================
Route::group(['middleware'=>['auth']], function(){
	Route::post('favourite/{post}/add', 'FavouriteController@Add')->name('post.favourite');
	Route::post('comment/{post}', 'CommentController@store')->name('comment.store');
});

//Admin all controller ============================
Route::group(['as'=>'admin.','prefix'=>'admin', 'namespace'=>'Admin','middleware'=>['auth','admin']], function(){
	Route::get('dashboard', 'DashboardController@index')->name('dashboard');
	Route::resource('tag', 'TagController');
	Route::resource('category', 'CategoryController');
	Route::resource('post', 'PostController');

	Route::get('pending/post', 'PostController@PendingPost')->name('post.pending');
	Route::put('post/{id}/approve', 'PostController@Approval')->name('post.approve');
	Route::get('subscribar/index', 'SubscribarController@index')->name('subscribar.index');
	Route::delete('subscribar/{id}/destroy', 'SubscribarController@destroy')->name('subscribar.destroy');

	//Setting controller
	Route::get('setting', 'SettingController@index')->name('settings');
	//Update Profile controller
	Route::put('update-profile', 'UpdateProfileController@update')->name('update.profile');
	Route::put('update-password', 'UpdateProfileController@updatePassword')->name('update.password');

	//favorite controller ======
	Route::get('favorite', 'FavoriteController@index')->name('favorite.index');

	//Comment controller =====
	Route::get('comments', 'CommentController@index')->name('comment.index');
	Route::delete('comments/{id}/destroy', 'CommentController@destroy')->name('comment.destroy');

	//Author show route are here====
	Route::get('authors', 'AuthorController@index')->name('author.index');
	Route::delete('authors/{id}', 'AuthorController@destroy')->name('author.destroy');

});

//Author all controller ===========================
Route::group(['as'=>'author.','prefix'=>'author', 'namespace'=>'Author','middleware'=>['auth','author']], function(){
	Route::get('dashboard', 'DashboardController@index')->name('dashboard');
	Route::resource('post', 'PostController');

	//Setting controller
	Route::get('setting', 'UpdateProfileController@index')->name('settings');
	//Update Profile controller
	Route::put('update-profile', 'UpdateProfileController@update')->name('update.profile');
	Route::put('update-password', 'UpdateProfileController@updatePassword')->name('update.password');

	//favorite controller ======
	Route::get('favorite', 'FavoriteController@index')->name('favorite.index');

	//Comment controller =====
	Route::get('comments', 'CommentController@index')->name('comment.index');
	Route::delete('comments/{id}/destroy', 'CommentController@destroy')->name('comment.destroy');
});


//Post rote are here================
Route::get('posts', 'PostController@index')->name('post.index');
Route::get('post/{slug}', 'PostController@PostDetails')->name('post.details');

//Category route are here===============
Route::get('/category/{slug}post', 'CategoryController@PostBycategory')->name('category.posts');
//Tag route Include category controller ===============
Route::get('/tag/{slug}', 'CategoryController@PostByTag')->name('tag.posts');

View::composer('layouts.frontend.partial.footer',function($view){
	$categories = App\Category::all();
	$view->with('categories',$categories);
});

//Search route are here===========
Route::get('search', 'SearchController@search')->name('search');

//Show author post ,,,Author route are here===
Route::get('profile/{user_name}','AuthorController@profile')->name('author.profile');