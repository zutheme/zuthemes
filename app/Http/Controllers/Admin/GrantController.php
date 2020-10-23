<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Role;
use App\User;
use App\Grant;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
class GrantController extends Controller{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        // $result = DB::select('call ListgrantProcedure()');
        // $grantperms = json_decode(json_encode($result), true);
        // return view('admin.grantperm.index',compact('grantperms'));
        $grantperms = $this->CheckPermission();
        $allow = $grantperms[0]['allow'];
        if($allow > 0 ){
             return view('admin.grantperm.index',compact('grantperms'));
        }else{
            return view('admin.welcome.disable');
        } 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(){
        $grantperms = $this->CheckPermission();
        $allow = $grantperms[0]['allow'];
        if($allow > 0 ){
             //return view('admin.grantperm.index',compact('grantperms'));
            $roles = Role::all()->toArray();
            $users = user::all()->toArray();
            return view('admin.grantperm.create',compact('roles','users'));
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
    public function store(Request $request){
        $message = "";  
        try {
            $iduserimp = Auth::id();
            $grantperm = new Grant(['idrole' => $request->get('sel_idrole'),'to_iduser' => $request->get('sel_to_iduser'),'by_iduser'=>$iduserimp]);
            $grantperm->save(); 
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        } 
        return redirect()->route('admin.grantperm.index')->with('success',"Đã cấp quyền thành công");
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
    public function edit($idgrant)
    {
        $grantperms = $this->CheckPermission();
        $allow = $grantperms[0]['allow'];
        if($allow > 0 ){
            $users = user::all()->toArray();
            $roles = Role::all()->toArray();
            $result = DB::select('call ListgrantbyidProcedure(?)',array($idgrant));
            $selected = json_decode(json_encode($result), true);
            return view('admin.grantperm.edit',compact('users','roles','selected','idgrant'));
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
    public function update(Request $request, $idgrant)
    {
        $byiduser = Auth::id();
        $grant = Grant::find($idgrant);
        $grant->idrole = $request->get('sel_idrole');
        $grant->to_iduser = $request->get('sel_touser');
        $grant->by_iduser = $byiduser;
        $grant->save();
        $message = "Đã cập nhật";
        return redirect()->route('admin.grantperm.index')->with('success',$message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($idgrant)
    {
        //$grant = Grant::find($idgrant);
        //$grant->delete();
        $grantperms = $this->CheckPermission();
        $allow = $grantperms[0]['allow'];
        if($allow > 0 ){
            $result = DB::select('call ListgrantbyidProcedure(?)',array($idgrant));
            //$selected = json_decode(json_encode($result), true);
            return redirect()->route('admin.grantperm.index')->with('success','record have deleted');
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
        $pattern_index = "/admin\/grantperm$/";
        $pattern_create = "/admin\/grantperm\/create$/";
        $pattern_edit = "/admin\/grantperm\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/grantperm\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/grantperm";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/grantperm/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/grantperm/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/grantperm/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call GrantRoleForUserProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard', $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    }
}
