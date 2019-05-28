<?php

namespace App\Http\Controllers\Author;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Intervention\Image\Facades\Image;
use Brian2694\Toastr\Facades\Toastr;

class UpdateProfileController extends Controller
{
    public function index()
    {
    	return view('author.settings');
    }

     public function update(Request $request)
    {
    	$validatedData = $request->validate([
	        'name' => 'required',
	        'email' => 'required|email',
	        'image' => 'required|image|mimes:jpeg,bmp,png,jpg',
    	]);

    	// Get Form Image
        $image = $request->file('image');
        $slug = str_slug($request->name);
        $user = User::findOrFail(Auth::id());
        if (isset($image))
        {
            $currentDate = Carbon::now()->toDateString();
            $imageName = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

            // Check if profile Dir exists
            if (!Storage::disk('public')->exists('profile'))
            {
                Storage::disk('public')->makeDirectory('profile');
            }

            // Delete old profile image
            if (Storage::disk('public')->exists('profile/'.$user->image))
            {
                Storage::disk('public')->delete('profile/'.$user->image);
            }
            // Resize image for profile and upload

            $profile = Image::make($image)->resize(500,500)->stream();
            Storage::disk('public')->put('profile/'.$imageName, $profile);

        }else{
        	 $imageName = $user->image;
        }

        $user->name = $request->name;
        $user->email = $request->email;
        $user->image = $imageName;
        $user->about = $request->about;

        $user->save();
        Toastr::success('Profile Update Successfully :)','Success');
        return redirect()->back();

    }

    //Update password=====================
    public function updatePassword(Request $request)
    {
        $validatedData = $request->validate([
            'old_password' => 'required',
            'password' => 'required|confirmed|min:6',
        ]);

        $sahsedPassword = Auth::user()->password;
        
        if (Hash::check($request->old_password, $sahsedPassword)) {

            if (!Hash::check($request->password,$sahsedPassword)) {
                
                $user = User::find(Auth::id());
                $user->password = Hash::make($request->password);
                $user->save();

                Toastr::success('Password Successfully changed :)','Success');
                Auth::logout();
                return redirect()->back();
            }else{
                Toastr::error('New Password can not be same as new password :)','Error');
                return redirect()->back();
            }
        }else{
            Toastr::error('Current password not matched :)','Error');
            return redirect()->back();
        }
    }
}
