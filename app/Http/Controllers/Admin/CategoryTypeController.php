<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\CategoryType;
use Illuminate\Support\Facades\DB;
use Auth;
class CategoryTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $cattypes = $this->CheckPermission();
        $allow = $cattypes[0]['allow'];
        if($allow > 0 ){
             //$cattypes = CategoryType::all()->toArray();
             return view('admin.cattype.index',compact('cattypes'));
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
        $cattypes = $this->CheckPermission();
        $allow = $cattypes[0]['allow'];
        if($allow > 0 ){
             return view('admin.cattype.create');
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
        $this->validate($request,['catnametype'=>'required']);

        $cattype = new CategoryType(['catnametype'=> $request->get('catnametype')]);

        $cattype->save();

        return redirect()->route('admin.cattype.index')->with('success','data added');
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
     public function edit($idcattype)
    {
        $cattypes = $this->CheckPermission();
        $allow = $cattypes[0]['allow'];
        if($allow > 0 ){
             $cattype = CategoryType::find($idcattype);
            return view('admin.cattype.edit',compact('cattype','idcattype'));
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
    public function update(Request $request, $idcattype)
    {
        $this->validate($request,['catnametype'=>'required']);
        //$idcustomer = $CategoryType->idcustomer;
        $cattype = CategoryType::find($idcattype);
        $cattype->catnametype = $request->get('catnametype');
        $cattype->save();

        return redirect()->route('admin.cattype.index')->with('success','data update');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   public function destroy($idcattype){
        //$cattype = CategoryType::find($idcattype);
        //$cattype->delete();
        $cattypes = $this->CheckPermission();
        $allow = $cattypes[0]['allow'];
        if($allow > 0 ){
            return redirect()->route('admin.cattype.index')->with('success','record have deleted');
        }else{
            return view('admin.welcome.disable');
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
        $pattern_index = "/admin\/cattype$/";
        $pattern_create = "/admin\/cattype\/create$/";
        $pattern_edit = "/admin\/cattype\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/cattype\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/cattype";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/cattype/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/cattype/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/cattype/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call EnableListCateTypeProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    }
}
