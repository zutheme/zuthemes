<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\PostType;
use App\category;
use App\CategoryType;
use Auth;
use Illuminate\Support\Facades\DB;
class PostTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$rs_posttypes = DB::select('call ListCategoryByTypeProcedure()');
        //$posttypes = json_decode(json_encode($rs_posttypes), true);
        $posttypes = $this->CheckPermission();
        $allow = $posttypes[0]['allow'];
        if($allow > 0 ){
            //$posttypes = PostType::all()->toArray();
            return view('admin.posttype.index',compact('posttypes'));
        }else{
            return view('admin.welcome.disable');
        }  
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $posttypes = $this->CheckPermission();
        $allow = $posttypes[0]['allow'];
        if($allow > 0 ){
            $rs_categories = DB::select('call ListAllCategoryProcedure()');
            $categories = json_decode(json_encode($rs_categories), true);
            return view('admin.posttype.create',compact('categories'));
        }else{
            return view('admin.welcome.disable');
        }  

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,['nametype'=>'required']);
        $posttype = new PostType(['nametype'=> $request->get('nametype'),'idparent' => $request->get('sel_idcategory')]);
        $posttype->save();
        return redirect()->route('admin.posttype.index')->with('success','data added');
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
    public function edit($idposttype)
    {
        $posttypes = $this->CheckPermission();
        $allow = $posttypes[0]['allow'];
        if($allow > 0 ){
            $rs_categories = DB::select('call ListAllCategoryProcedure()');
            $categories = json_decode(json_encode($rs_categories), true);
            $posttype = PostType::find($idposttype);
            return view('admin.posttype.edit',compact('posttype','idposttype','categories'));
        }else{
            return view('admin.welcome.disable');
        }  
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $idposttype)
    {
        $this->validate($request,['nametype'=>'required']);
        //$idcustomer = $posttype->idcustomer;
        $posttype = PostType::find($idposttype);
        $posttype->nametype = $request->get('nametype');
        $posttype->idparent = $request->get('sel_idcategory');
        $posttype->save();

        return redirect()->route('admin.posttype.index')->with('success','data update');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   public function destroy($idposttype){
        //$posttype = PostType::find($idposttype);
        //$posttype->delete();
        $posttypes = $this->CheckPermission();
        $allow = $posttypes[0]['allow'];
        if($allow > 0 ){
            return redirect()->route('admin.posttype.index')->with('success','record have deleted');
        }else{
            return view('admin.welcome.disable');
        }
    }
    public function curent_url(){
        $totalSegsCount = count(\Request::segments());
        $url = '';
        for ($i = 0; $i < $totalSegsCount; $i++) { 
            $url .= \Request::segment($i+1)."/";
        }
        $url = rtrim($url, '/');
        $_command = "select";
        $pattern_index = "/admin\/posttype$/";
        $pattern_create = "/admin\/posttype\/create$/";
        $pattern_edit = "/admin\/posttype\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/posttype\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/posttype";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/posttype/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/posttype/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/posttype/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call EnableListPostTypeProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    }
}
