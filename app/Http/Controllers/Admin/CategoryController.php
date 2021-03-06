<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Category;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Brian2694\Toastr\Facades\Toastr;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::latest()->get();
        return view('admin.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request , [
            'name'          => 'required|unique:categories',
            'image'         =>  'required|mimes:jpeg,bmp,png,jpg'
        ]);

        // Get Form Image
        $image = $request->file('image');
        $slug = str_slug($request->name);
        if (isset($image))
        {
            $currentDate = Carbon::now()->toDateString();
            $imageName = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
            // Check if Category Dir exists
            if (!Storage::disk('public')->exists('category'))
            {
                Storage::disk('public')->makeDirectory('category');
            }
            // Resize image for category and upload
            $categoryImage = Image::make($image)->resize(1600,479)->stream();
            Storage::disk('public')->put('category/'.$imageName,$categoryImage);

            // Check if Category Slider Dir exists
            if (!Storage::disk('public')->exists('category/slider'))
            {
                Storage::disk('public')->makeDirectory('category/slider');
            }

            // Resize image for category slider and upload
            $slider = Image::make($image)->resize(500,333)->stream();
            Storage::disk('public')->put('category/slider/'.$imageName, $slider);

        }
        else
        {
            $imageName = 'default.png';
        }

        $category = new Category();
        $category->name = $request->name;
        $category->slug = $slug;
        $category->image = $imageName;

        $category->save();
        Toastr::success('Category Saved Successfully','Success');
        return redirect()->route('admin.category.index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $category = Category::findorfail($id);
        return view('admin.category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request , [
            'name'          => 'required',
            'image'         =>  'mimes:jpeg,bmp,png,jpg'
        ]);

        // Get Form Image
        $image = $request->file('image');
        $slug = str_slug($request->name);
        $category = Category::find($id);

        if (isset($image))
        {
            $currentDate = Carbon::now()->toDateString();
            $imageName = $slug.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();
            // Check if Category Dir exists
            if (!Storage::disk('public')->exists('category'))
            {
                Storage::disk('public')->makeDirectory('category');
            }

            // Delete old category image
            if (Storage::disk('public')->exists('category/'.$category->image))
            {
                Storage::disk('public')->delete('category/'.$category->image);
            }


            // Resize image for category and upload
            $categoryImage = Image::make($image)->resize(1600,479)->stream();
            Storage::disk('public')->put('category/'.$imageName,$categoryImage);

            // Check if Category Slider Dir exists
            if (!Storage::disk('public')->exists('category/slider'))
            {
                Storage::disk('public')->makeDirectory('category/slider');
            }

            // Delete old category slider image
            if (Storage::disk('public')->exists('category/slider/'.$category->image)) 
            {
                Storage::disk('public')->delete('category/slider/'.$category->image);
            }

            // Resize image for category slider and upload
            $slider = Image::make($image)->resize(500,333)->stream();
            Storage::disk('public')->put('category/slider/'.$imageName, $slider);

        }
        else
        {
            $imageName = $category->image;
        }
        $oldphoto=$request->old_photo;
        $category->name = $request->name;
        $category->slug = $slug;
        $category->image = $imageName;

        $category->save();
        Toastr::success('Category Update Successfully :)','Success');
        return redirect()->route('admin.category.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $CategoryDelete = Category::find($id);
        $CategoryDelete->delete();
        Toastr::success('Category Deleted Successfully :)','Success');
        return redirect()->back();
    }
}
