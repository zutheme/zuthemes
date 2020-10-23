<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\ImpPerm;
use App\Permission;
use App\Role;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
class ImpPermController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $result = DB::select('call ListImppermProcedure()');
        // $impperms = json_decode(json_encode($result), true);
        // return view('admin.impperm.index',compact('impperms'));
        $impperms = $this->CheckPermission();
        $allow = $impperms[0]['allow'];
        if($allow > 0 ){
             return view('admin.impperm.index',compact('impperms'));
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
        $impperms = $this->CheckPermission();
        $allow = $impperms[0]['allow'];
        if($allow > 0 ){
             //return view('admin.impperm.index',compact('impperms'));
            $permissions = Permission::all()->toArray();
            $roles = Role::all()->toArray();
            return view('admin.impperm.create',compact('permissions','roles'));
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
        // $validator = Validator::make($request->all(), [ 
        //     'name' => 'required'
        // ]);
        // if ($validator->fails()) { 
        //     $errors = $validator->errors();
        //     return redirect()->route('admin.impperm.create')->with(compact('errors'));           
        // }
        $input = $request->all();          
        $message = "";  
        try {
            $iduserimp = Auth::id();
            $impperm = new ImpPerm(['idperm' => $request->get('sel_idperm'),'idrole' => $request->get('sel_idrole'),'iduserimp'=>$iduserimp]);
            $impperm->save(); 
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        } 
        return redirect()->route('admin.impperm.index')->with('success',"Đã tạo quyền thành công");
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
    public function edit($id_impperm){       
        $impperms = $this->CheckPermission();
        $allow = $impperms[0]['allow'];
        if($allow > 0 ){
            $permissions = Permission::all()->toArray();
            $roles = Role::all()->toArray();
            $result = DB::select('call ImppermbyidProcedure(?)',array($id_impperm));
            $selected = json_decode(json_encode($result), true);
            return view('admin.impperm.edit',compact('permissions','roles','selected','id_impperm'));
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
    public function update(Request $request, $id_impperm)
    {
        //$this->validate($request,['sel_idperm'=>'required']);
        $iduserimp = Auth::id();  
        $impperm = ImpPerm::find($id_impperm);
        $impperm->idperm = $request->get('sel_idperm');
        $impperm->idrole = $request->get('sel_idrole');
        $impperm->iduserimp = $iduserimp;
        $impperm->save();
        return redirect()->route('admin.impperm.index')->with('success','data update');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id_impperm)
    {
        $impperms = $this->CheckPermission();
        //$allow = $impperms[0]['allow'];
        if(isset($impperms) && $impperms[0]['allow'] > 0 ){
            $result = DB::select('call DeletePermissionProcedure(?)',array($id_impperm));
            return redirect()->route('admin.impperm.index')->with('success','record have deleted');
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
        $pattern_index = "/admin\/impperm$/";
        $pattern_create = "/admin\/impperm\/create$/";
        $pattern_edit = "/admin\/impperm\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/impperm\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/impperm";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/impperm/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/impperm/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/impperm/0";
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