<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Role;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Support\MessageBag;
use Illuminate\Routing\UrlGenerator;
class RoleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $roles = role::all()->toArray();
        $chkroles = $this->CheckPermission();
        $allow = $chkroles[0]['allow'];
        if($allow > 0 ){
            return view('admin.roles.index',compact('roles'));
        }else{
            return view('admin.welcome.disable');
            //return redirect()->route('admin.welcome.disable')->with('disable');
        }  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $roles = $this->CheckPermission();
        $allow = $roles[0]['allow'];
        if($allow > 0 ){
            return view('admin.roles.create');
        }else{
            return view('admin.welcome.disable');
            //return redirect()->route('admin.welcome.disable')->with('disable');
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
        $validator = Validator::make($request->all(), [ 
            'name' => 'required'
        ]);
        if ($validator->fails()) { 
            $errors = $validator->errors();
            return redirect()->route('admin.roles.create')->with(compact('errors'));           
        }
        $input = $request->all();  
        try {
            $role = Role::create($input); 
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        }
        return redirect()->route('admin.roles.index')->with('success','data added');
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
    public function edit($idrole)
    {
        $roles = $this->CheckPermission();
        $allow = $roles[0]['allow'];
        if($allow > 0 ){
            $roles = role::find($idrole);
            return view('admin.roles.edit',compact('roles','idrole'));
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
    public function update(Request $request, $idrole)
    {
        $this->validate($request,['name'=>'required']);
        //$idcustomer = $role->idcustomer;
        $role = role::find($idrole);
        $role->name = $request->get('name');
        $role->description = $request->get('description');
        $role->save();
        return redirect()->route('admin.roles.index')->with('success','data update');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($idrole)
    {     
        $roles = $this->CheckPermission();
        $allow = $roles[0]['allow'];
        if($allow > 0 ){
            $qr_roles = DB::select('call DeleteRoleProcedure(?)',array($idrole));
            //$roles = json_decode(json_encode($qr_roles), true);
            return redirect()->route('admin.roles.index')->with('success','record have deleted');
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
        $pattern_index = "/admin\/roles$/";
        $pattern_create = "/admin\/roles\/create$/";
        $pattern_edit = "/admin\/roles\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/roles\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/roles";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/roles/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/roles/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/roles/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_roles = DB::select('call ListRolePermissionProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $roles = json_decode(json_encode($qr_roles), true);
        return $roles;
    }
}
