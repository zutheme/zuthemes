<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\status_type;
use Auth;
use Illuminate\Support\Facades\DB;
class StatusTypeController extends Controller{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        $statustypes = $this->CheckPermission();
        $allow = $statustypes[0]['allow'];
        if($allow > 0 ){
             //$statustypes = status_type::all()->toArray();
        return view('admin.statustype.index',compact('statustypes'));
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
        $statustypes = $this->CheckPermission();
        $allow = $statustypes[0]['allow'];
        if($allow > 0 ){
             return view('admin.statustype.create');
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
        $this->validate($request,['name_status_type'=>'required']);

        $statustype = new status_type(['name_status_type'=> $request->get('name_status_type')]);

        $statustype->save();

        return redirect()->route('admin.statustype.index')->with('success','data added');
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
    public function edit($id_status_type){
        $statustypes = $this->CheckPermission();
        $allow = $statustypes[0]['allow'];
        if($allow > 0 ){
             $statustypes = status_type::find($id_status_type);
             return view('admin.statustype.edit',compact('statustypes','id_status_type'));
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
    public function update(Request $request, $idstatustype)
    {
        $this->validate($request,['name_status_type'=>'required']);
        //$idcustomer = $statustype->idcustomer;
        $statustype = status_type::find($idstatustype);
        $statustype->name_status_type = $request->get('name_status_type');
        $statustype->save();

        return redirect()->route('admin.statustype.index')->with('success','data update');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
   public function destroy($idstatustype)
    {
        //$statustype = status_type::find($idstatustype);
        //$statustype->delete();
        $statustypes = $this->CheckPermission();
        $allow = $statustypes[0]['allow'];
        if($allow > 0 ){
             return redirect()->route('admin.statustype.index')->with('success','record have deleted');
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
        $pattern_index = "/admin\/statustype$/";
        $pattern_create = "/admin\/statustype\/create$/";
        $pattern_edit = "/admin\/statustype\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/statustype\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/statustype";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/statustype/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/statustype/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/statustype/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call EnableListStatusTypeProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    }
}
