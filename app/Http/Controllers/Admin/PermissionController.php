<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Support\MessageBag;
use App\Permission;
use App\Role;
use App\ImpPerm;
use App\perm_command;
use Illuminate\Support\Facades\Input;
use App\menu;
use App\category;
use App\CategoryType;
use App\PostType;
class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $main_menu='';
    public function index()
    {
        $permissions = $this->CheckPermission();
        $allow = $permissions[0]['allow'];
        if($allow > 0 ){
             return view('admin.permission.index',compact('permissions'));
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
        $permissions = $this->CheckPermission();
        $allow = $permissions[0]['allow'];
        if($allow > 0 ){
            $categorytypes = CategoryType::all()->toArray();
            $perm_commands = perm_command::all()->toArray();
            return view('admin.permission.create',compact('perm_commands','categorytypes'));
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
    public function store(Request $request){
        $validator = Validator::make($request->all(), ['name' => 'required','idpermcommand' => 'required']);
        if ($validator->fails()) { 
            $errors = $validator->errors();
            return redirect()->route('admin.permission.create')->with(compact('errors'));           
        }
        $input = $request->all();
        $name = $request->get('name');
        $description = $request->get('description');
        $idpermcommand = $request->get('idpermcommand');         
        $message = "";
        $idcategory = 0;  
        try {
            $iduserimp = Auth::id();
            //$idcategory = $request->input('list_check');
            $l_idcategory = $request->input('list_check');
            if($l_idcategory){
                foreach ($l_idcategory as $_idcategory) {
                   $idcategory = $_idcategory;
                } 
            }
            $qr_permission = DB::select('call AddPermissionProcedure(?,?,?,?)',array($name, $description, $idpermcommand, $idcategory));
            $rs_permission = json_decode(json_encode($qr_permission), true);
            $result = $name.','.$idpermcommand.','.$idcategory.','.$iduserimp;
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        } 
        return redirect()->route('admin.permission.index')->with('success',$result);
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
    public function edit($idperm)
    {
        $rt_permissions = $this->CheckPermission();
        $allow = $rt_permissions[0]['allow'];
        if($allow > 0 ){
             DB::enableQueryLog();
            //$permissions = permission::find($idperm);
            $qr_permissions = DB::select('call PermissionByidProcedure(?)',array($idperm));
            $permissions = new \stdClass();
            foreach ($qr_permissions as $item) {
                foreach ($item as $key => $value) {
                    $permissions->$key = $value;
                }
            }
            $categorytypes = CategoryType::all()->toArray();
            $perm_commands = perm_command::all()->toArray();
            $result = DB::select('call ListRoleIdpermProcedure(?)',array($idperm));
            $roles = json_decode(json_encode($result), true);
            $idcategory = $permissions->idcategory;
            $cate_selected = array($idcategory);
            $idperm = $permissions->idperm;
            $listcate = $this->catebytype($idperm,$cate_selected);
            return view('admin.permission.edit',compact('permissions','idperm','roles','perm_commands','categorytypes','listcate'));
        }else{
            return view('admin.welcome.disable');
        } 

    }
    public function map($value){
        return (array)$value;
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $idperm)
    {
        $this->validate($request,['name'=>'required']);
        //$permission = permission::find($idperm);
        $name = $request->get('name');
        $description = $request->get('description');
        $idpermcommand = $request->get('idpermcommand');
        $iduserimp = Auth::id();
        $idcategory = 0;
        $message = "";
        try {
            //$iduserimp = Auth::id();
            $l_idcategory = $request->input('list_check');
            if($l_idcategory){
                foreach ($l_idcategory as $_idcategory) {
                   $idcategory = $_idcategory;
                } 
            }
            $qr_permission = DB::select('call UpdatePermissionProcedure(?,?,?,?,?)',array($name, $description, $idpermcommand, $idcategory, $idperm));
            $rs_permission = json_decode(json_encode($qr_permission), true);
           $message = $name.','.$idpermcommand.','.$idcategory.','.$iduserimp.','.$idperm;
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        } 
        return redirect()->route('admin.permission.index')->with('success',$message);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($idperm)
    {
        //$permission = permission::find($idperm);
        //$permission->delete();
        $permissions = $this->CheckPermission();
        $allow = $permissions[0]['allow'];
        if($allow > 0 ){
            return redirect()->route('admin.permission.index')->with('success','record have deleted');
        }else{
            return view('admin.welcome.disable');
        }
    }
    //show sub category
    public function catebytypehtml($_idcatetype,$cate_selected = array()) {
        $qr_catebytype = DB::select('call ListAllCateByIdcatetype(?)',array($_idcatetype));
        $categories = json_decode(json_encode($qr_catebytype), true);
        $this->showCategories($categories,0,$cate_selected);
        $result =  $this->main_menu;
        return response()->json(array('success' => true, 'result' => $result), 200);
    }
    public function catebytype($_idcatetype,$cate_selected = array()) {
        $qr_catebytype = DB::select('call ListAllCateByIdcatetype(?)',array($_idcatetype));
        $categories = json_decode(json_encode($qr_catebytype), true);
        $this->showCategories($categories,0,$cate_selected);
        $result =  $this->main_menu;
        return $result;
        //return response()->json(array('success' => true, 'result' => $result), 200);
    }
    public function showCategories($categories, $idparent = 0, $cate_selected){
        $cate_child = array();
        foreach ($categories as $key => $item) {
            if ($item['idparent'] == $idparent){
                $cate_child[] = $item;
                unset($categories[$key]);
            }
        }
        $list_cat="";     
        if($cate_child) {
            
            $this->main_menu .= '<ul class="list-check">';
            foreach ($cate_child as $key => $item){
                $this->main_menu .= '<li><input class="array-parent" type="hidden" value="'.$idparent.'">';
                if(in_array($item['idcategory'], $cate_selected)){
                     $checked='checked';
                }else{
                    $checked='';
                }
                $this->main_menu .= '<input name="list_check[]" class="array-check" type="radio" value="'.$item['idcategory'].'" '.$checked.' ><label>'.$item['namecat'].'</label>';
                $this->showCategories($categories, $item['idcategory'], $cate_selected);
                $this->main_menu .= '</li>';
            }
            $this->main_menu .= '</ul>';
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
        $pattern_index = "/admin\/permission$/";
        $pattern_create = "/admin\/permission\/create$/";
        $pattern_edit = "/admin\/permission\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/permission\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/permission";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/permission/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/permission/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/permission/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call ListEnablePermission(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    }
}
