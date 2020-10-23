<?php

namespace App\Http\Controllers\teamilk;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Products;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Support\MessageBag;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
use App\Posts;
use App\Impposts;
use App\PostType;
use App\category;
use App\status_type;
use App\files;
use File;
use App\func_global;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($idproduct)
    {
        $_namecattype="post";
        $iduser = Auth::id();
        $_idstore = 31;
        $qr_cateselected = DB::select('call SelCateSelectedProcedure(?)',array($idproduct));
        $cate_selected = json_decode(json_encode($qr_cateselected), true);
        $qr_size = DB::select('call SelAllSizeProcedure');
        $size = json_decode(json_encode($qr_size), true);
        $qr_cat_product = DB::select('call ListAllCatByTypeProcedure(?)',array($_namecattype));
        $rs_cat_product = json_decode(json_encode($qr_cat_product), true);
        $qr_product = DB::select('call SelProductByIdProcedure(?,?,?)',array($idproduct,$_idstore,$iduser));
        $product = json_decode(json_encode($qr_product), true);
        $_idgallery = 2;
        $qr_gallery = DB::select('call SelGalleryProcedure(?,?)',array($idproduct,$_idgallery));
        $gallery = json_decode(json_encode($qr_gallery), true);
        $qr_sel_cross_byidproduct = DB::select('call SelProductCrossByIdProcedure(?)',array($idproduct));
        $sel_cross_byidproduct = json_decode(json_encode($qr_sel_cross_byidproduct), true);
        $sel_relative_byidproduct = '';
        $categories = '';
        return view('teamilk.post.show',compact('sel_relative_byidproduct','gallery','product','categories','idproduct','sel_cross_byidproduct','cate_selected','rs_cat_product'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
    //show sub category
    public function change_price_idproduct(){
        $input = json_decode(file_get_contents('php://input'),true);
        $_idproduct = $input['idproduct'];       
        try {
            $qr_price = DB::select('call ChangePriceByIdProductProcedure(?)',array($_idproduct));
            $rs_price = json_decode(json_encode($qr_price), true);     
            return response()->json($rs_price); 
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return response()->json($errors); 
        }
    }
    public function listviewproductbyidcate($_idcategory){
        $_page = 1; $_limit = 100; $_idstore = 31;
        try {
            $qr_cat_product = DB::select('call ListAllCatByTypeProcedure(?)',array('product'));
            $rs_cat_product = json_decode(json_encode($qr_cat_product), true);
            $iduser = Auth::id();
            $qr_lpro = DB::select('call ListProductByIdcateProcedure(?,?,?,?,?)',array($_idcategory, $_page, $_idstore, $_limit, $iduser));
            $rs_lpro = json_decode(json_encode($qr_lpro), true);     
             return view('teamilk.post.index')->with(compact('rs_lpro','_idcategory','rs_cat_product','iduser'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.post.index')->with('error',$errors);
        }
    }
    public function LatestProductByIdcate($_idcategory,$_limit){
        try {
            $qr_lpro = DB::select('call LatestProductByIdcateProcedure(?,?)',array($_idcategory, $_limit));
            //$qr_lpro = DB::select('call ListViewProductByIdCateProcedure(?)',array($_idcategory));
            $rs_lpro = json_decode(json_encode($qr_lpro), true);     
             return view('teamilk.product.index')->with(compact('rs_lpro','_idcategory'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.post.index')->with('error',$errors);
        }
    }
    public function listproductbypage($_idcategory = 0, $_page = 1){
        try {
             $_limit = 100; $_idstore = 31;
             $iduser = Auth::id();
             $qr_cat_product = DB::select('call ListAllCatByTypeProcedure(?)',array('product'));
             $rs_cat_product = json_decode(json_encode($qr_cat_product), true);
             $qr_lpro = DB::select('call ListProductByIdcateProcedure(?,?,?,?,?)',array($_idcategory,$_page,$_idstore,$_limit,$iduser));
            //$qr_lpro = DB::select('call ListViewProductByIdCateProcedure(?)',array($_idcategory));
            $rs_lpro = json_decode(json_encode($qr_lpro), true);     
             return view('teamilk.post.index')->with(compact('rs_lpro','_idcategory','rs_cat_product'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.post.index')->with('error',$errors);
        }
    }
    public function listproductbyidcategory($_idcategory,$_page,$_limit){
        try {
            $_limit =100;
             $qr_lpro = DB::select('call ListProductByIdcateProcedure(?,?,?,?)',array($_idcategory,$_page,$_idstore,$_limit));
            //$qr_lpro = DB::select('call ListViewProductByIdCateProcedure(?)',array($_idcategory));
            $rs_lpro = json_decode(json_encode($qr_lpro), true);     
             return view('teamilk.post.index')->with(compact('rs_lpro','_idcategory'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.post.index')->with('error',$errors);
        }
    }
    public function curent_url()
    {
       $totalSegsCount = count(\Request::segments());
        $url = '';
        for ($i = 0; $i < $totalSegsCount; $i++) { 
            $url .= \Request::segment($i+1)."/";
        }
        $url = rtrim($url, '/');
        $_command = "select";
        $pattern_index = "/post\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "post/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call GrantPermissionRoleProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    }
}
