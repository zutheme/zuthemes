<?php
namespace App\Http\Controllers\teamilk;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
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

class ProductController extends Controller
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
    public function show($idproduct){
        $_namecattype="product";
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
        return view('teamilk.product.show',compact('sel_relative_byidproduct','gallery','product','categories','idproduct','sel_cross_byidproduct','cate_selected','rs_cat_product'));
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function showposttype($_namecattype, $idproduct){
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
        return view('teamilk.product.show',compact('sel_relative_byidproduct','gallery','product','categories','idproduct','sel_cross_byidproduct','cate_selected','rs_cat_product'));
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
             return view('teamilk.product.index')->with(compact('rs_lpro','_idcategory','rs_cat_product','iduser'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.product.index')->with('error',$errors);
        }
    }
    public function ListTypePostbyIdcate($_idcategory,$_posttype){
        $_page = 1; $_limit = 100; $_idstore = 31;
        try {
            $qr_cat_product = DB::select('call ListAllCatByTypeProcedure(?)', array($_posttype));
            $rs_cat_product = json_decode(json_encode($qr_cat_product), true);
            $iduser = Auth::id();
            $qr_lpro = DB::select('call ListProductByIdcateProcedure(?,?,?,?,?)',array($_idcategory, $_page, $_idstore, $_limit, $iduser));
            $rs_lpro = json_decode(json_encode($qr_lpro), true);     
             return view('teamilk.product.index')->with(compact('rs_lpro','_idcategory','rs_cat_product','iduser'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.product.index')->with('error',$errors);
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
            return view('teamilk.product.index')->with('error',$errors);
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
             return view('teamilk.product.index')->with(compact('rs_lpro','_idcategory','rs_cat_product'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.product.index')->with('error',$errors);
        }
    }
    public function listproductbyidcategory($_idcategory,$_page,$_limit){
        try {
            $_limit =100;
             $qr_lpro = DB::select('call ListProductByIdcateProcedure(?,?,?,?)',array($_idcategory,$_page,$_idstore,$_limit));
            //$qr_lpro = DB::select('call ListViewProductByIdCateProcedure(?)',array($_idcategory));
            $rs_lpro = json_decode(json_encode($qr_lpro), true);     
             return view('teamilk.product.index')->with(compact('rs_lpro','_idcategory'));
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return view('teamilk.product.index')->with('error',$errors);
        }
    }
    public function orderhistory(Request $request){
        $input = json_decode(file_get_contents('php://input'),true);
        $_idproduct = $input['idproduct'];
        $_quality = $input['quality'];
        $_userid_order = $input['userid_order'];
        $_idstore = 31;   
        $idorderhis = 1;
        $str_session = session()->get('orderhistory');
        $str_item ="";
        $idorder = 1;
        $parent = 0;
        if(!isset($str_session)||empty($str_session)){
            $qr_initsession = DB::select("CALL InitsessionProcedure(?,?,?,?)",array($_idproduct, $_quality, $_idstore, $idorder));
            $rs_initsession = json_decode(json_encode($qr_initsession), true);         
            foreach ($rs_initsession as $row) {
                $quality_sale = $_quality; 
                if(isset($row['parent']) && $row['parent']!=0){
                    $quality_sale = $row['quality_sale']*$_quality;
                }
                $str_item .= '{"idorder":'.$row['idorder'].',"idcrosstype":'.$row['idcrosstype'].',"parent":'.$row['parent'].',"idparentcross":'.$row['idparentcross'].',"input_quality":'.$row['input_quality'].',"idproduct":'.$row['idproduct'].',"inp_session":'.$quality_sale.',"trash":1},';
                $idorder++;
            }
            $str_item = substr_replace($str_item ,"", -1);
            $str_item = "[".$str_item."]";           
        }else{
            $Object = json_decode($str_session,true);
            $idorder = 1;
            foreach ( $Object as $item) {
                if(!empty($item)){
                    $idorder++;
                }
            }
           
            try{
                $qr_initsession = DB::select("CALL InitsessionProcedure(?,?,?,?)",array($_idproduct, $_quality, $_idstore, $idorder));
                $rs_initsession = json_decode(json_encode($qr_initsession), true);
                //return response()->json($rs_initsession);
                foreach ($rs_initsession as $row) {
                    $quality_sale = $_quality; 
                    if($row['parent']!=0){
                        $quality_sale = $row['quality_sale']*$_quality;
                    }
                    $Object[] = ['idorder'=>$row['idorder'],'idcrosstype'=>$row['idcrosstype'],'parent'=>$row['parent'],'idparentcross'=>$row['idparentcross'],'input_quality'=>$row['input_quality'],'idproduct' => $row['idproduct'],'inp_session'=>$quality_sale,'trash' => 1];
                    $idorder++;
                }
            }
            catch (\Illuminate\Database\QueryException $ex) {
                $errors = new MessageBag(['error' => $ex->getMessage()]);
                return response()->json($errors);
            }
            $str_item = json_encode($Object);  
        }
        //$request->session()->keep(['username', 'email']);
        session()->put('orderhistory', $str_item);
        session()->save();
        //$arr_session = array();
        //$arr_session[] = array('','str_item' => $str_item);
        return response()->json($str_session);
    }
    //change quality session
    public function changequality(Request $request){
        $input = json_decode(file_get_contents('php://input'),true);
        //$_idorder = $input['idorder'];
        //$_quality = $input['quality'];
        $_userid_order = $input['userid_order'];
        $_listchange = $input['listchange'];
        //$str_json = stripslashes($_listchange);
        $Object = json_decode($_listchange,true);
        $str_Object = session()->get('orderhistory');
        $data = json_decode($str_Object,true);
        foreach ($Object as $row) {
            $_idorder = $row['idorder'];
            $_quality = $row['quality'];
            $_trash = $row['trash'];
            foreach($data as $key => $value){
                if($data[$key]['idorder']==$_idorder){
                    $data[$key]['inp_session'] = $_quality;
                    $data[$key]['trash'] = $_trash;
                }
            }
        }
         $str_item = json_encode($data); 
         session()->put('orderhistory', $str_item);
         session()->save();
         $str_Object = session()->get('orderhistory');
         return response()->json($str_Object);
    }
    //change quality session
    public function cartnumber(Request $request){
        $input = json_decode(file_get_contents('php://input'),true);
        $_userid_order = $input['userid_order'];
        $str_Object = session()->get('orderhistory');
        $data = json_decode($str_Object,true);
        $numbercart = 0;
        if(!empty($data)){
            foreach ($data as $row) {
                if($row['trash'] > 0 ){
                    $numbercart++;
                }
            }
        }
        return response()->json($numbercart);
    }
     public function remove_item(Request $request){
        $input = json_decode(file_get_contents('php://input'),true);
        $_idproduct = $input['idproduct'];
        $_quality = $input['quality'];
        $_userid_order = $input['userid_order'];
        //$qr_orderhis = DB::select('call OrderHistoryProcedure(?,?,?)',array($_userid_order,$_idproduct,$_quality));
        //$orderhistory = json_decode(json_encode($qr_orderhis), true);
        //$idorderhis = $orderhistory[0]['orderhistory'];
        $arr_his = session()->get('orderhistory');
        $_trash = 1;
        if(isset($arr_his)){
            $Object = json_decode($arr_his,true);
            $Object[] = ['idproduct' => $_idproduct,'quality' => $_quality,'trash' => $_trash];
            $str_Object = json_encode($Object);
        }
        session()->put('orderhistory', $str_Object);
        //session()->save();
        return response()->json($idorderhistory);
    }
     public function delete_session(Request $request){
        $request->session()->forget('orderhistory');
         return view('teamilk.product.index');
     }
     public function get_sesstion(Request $request){
        $_session = $request->session()->get('orderhistory');
         return view('teamilk.product.index')->with(compact('_session',$_session));
     }
     //change quality session
    public function productbyslug(Request $request, $_slug){
        $iduser = Auth::id();
        $_idstore = 31;
        //get idproduct by slug
        $_idcategory = $this->search_slug_cate($_slug);
        if(isset($_idcategory) && $_idcategory > 0){
            $_posttype = "product";
            return $this->ListTypePostbyIdcate($_idcategory,$_posttype);
        }
        // $_page = 1; $_limit = 100; $_idstore = 31;
        // try {
        //     $qr_cat_product = DB::select('call ListAllCatByTypeProcedure(?)', array($_posttype));
        //     $rs_cat_product = json_decode(json_encode($qr_cat_product), true);
        //     $iduser = Auth::id();
        //     $qr_lpro = DB::select('call ListProductByIdcateProcedure(?,?,?,?,?)',array($_idcategory, $_page, $_idstore, $_limit, $iduser));
        //     $rs_lpro = json_decode(json_encode($qr_lpro), true);     
        //      return view('teamilk.product.index')->with(compact('rs_lpro','_idcategory','rs_cat_product','iduser'));
        // } catch (\Illuminate\Database\QueryException $ex) {
        //     $errors = new MessageBag(['error' => $ex->getMessage()]);
        //     return view('teamilk.product.index')->with('error',$errors);
        // }
        $qr_getidproduct = DB::select('call SelIdproductBySlugProcedure(?)',array($_slug));
        $rs_getidproduct = json_decode(json_encode($qr_getidproduct), true);
        $idproduct = $rs_getidproduct[0]['idproduct'];
        $_namecattype = $rs_getidproduct[0]['nametype'];
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
        return view('teamilk.product.show',compact('sel_relative_byidproduct','gallery','product','categories','idproduct','sel_cross_byidproduct','cate_selected','rs_cat_product'));
    }
    public function search_slug_cate($_slug){
        $iduser = Auth::id();
        $_idstore = 31;
        //get idproduct by slug
        $qr_getidcate = DB::select('call SelIdcategoryBySlugProcedure(?)',array($_slug));
        $rs_getidcate = json_decode(json_encode($qr_getidcate), true);
        $_idcategory = 0;
        if(isset($rs_getidcate) && isset($rs_getidcate[0]['idcategory']) ){
            $_idcategory = $rs_getidcate[0]['idcategory']; 
        }
        return $_idcategory;
        //if(isset($_idcategory) && $_idcategory > 0){
            //$this->ListTypePostbyIdcate($_idcategory,$_posttype);
        //}
        //ListTypePostbyIdcate($_idcategory,$_posttype);
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
		$pattern_index = "/product\/[0-9]+$/";
		$matches = array();
		if (preg_match($pattern_index, $url, $matches)){
			$_command = "select";
			$url = "product/0";
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