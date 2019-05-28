<?php

namespace App\Http\Controllers\Admin;
use App\Subscribar;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Brian2694\Toastr\Facades\Toastr;

class SubscribarController extends Controller
{
    public function index()
    {
    	$subscribars = Subscribar::latest()->get();
    	return view('admin.subscribar.index', compact('subscribars'));
    }

    public function destroy($id)
    {
    	$subscribars = Subscribar::findorfail($id);
    	$subscribars->delete();
    	Toastr::success('Subscribar Deleted Successfully :)','Success');
        return redirect()->back();
    }
}
