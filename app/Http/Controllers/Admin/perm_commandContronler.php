<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Validator;
use Illuminate\Support\Facades\Input;
use App\perm_command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class perm_commandContronler extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $perm_commands = $this->CheckPermission();      
        $allow = $perm_commands[0]['allow'];
        if($allow > 0 ){
            return view('admin.perm_command.index',compact('perm_commands'));
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
        $perm_commands = $this->CheckPermission();
        $allow = $perm_commands[0]['allow'];
        if($allow > 0 ){
            return view('admin.perm_command.create');
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
        $validator = Validator::make($request->all(), [ 
            'name' => 'required'
        ]);
        if ($validator->fails()) { 
            $errors = $validator->errors();
            return redirect()->route('admin.perm_command.create')->with(compact('errors'));           
        }
        try {       
            $perm_command = new perm_command();
            $perm_command->command = $request->get('name');
            $perm_command->description = $request->get('description');
            $perm_command->save();
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        } 
        return redirect()->route('admin.perm_command.index')->with('success',"Đã tạo quyền thành công");
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
    public function edit($idpercommand)
    {
        $perm_commands = $this->CheckPermission();      
        $allow = $perm_commands[0]['allow'];
        if($allow > 0 ){
            $perm_command = perm_command::find($idpercommand);
            return view('admin.perm_command.edit',compact('perm_command','idpercommand'));
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
    public function update(Request $request, $idpercommand)
    {
         $this->validate($request,['name'=>'required']);
        $perm_command = perm_command::find($idpercommand);
        $perm_command->command = $request->get('name');
        $perm_command->description = $request->get('description');
        $perm_command->save();
        return redirect()->route('admin.perm_command.index')->with('success',"Đã cập nhật");
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($idpercommand)
    {
        $perm_commands = $this->CheckPermission();      
        $allow = $perm_commands[0]['allow'];
        if($allow > 0 ){
            //$perm_command = perm_command::find($idpercommand);
            $qr_perm_commands = DB::select('call DeleteCommandProcedure(?)',array($idpercommand));
            return redirect()->route('admin.perm_command.index')->with('success','record have deleted');
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
        $pattern_index = "/admin\/perm_command$/";
        $pattern_create = "/admin\/perm_command\/create$/";
        $pattern_edit = "/admin\/perm_command\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/perm_command\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/perm_command";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/perm_command/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/perm_command/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/perm_command/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_perm_commands = DB::select('call ListPermissionCommands(?,?,?,?)',array($_iduser, $_command ,'dashboard' , $_curent_url));
        $perm_commands = json_decode(json_encode($qr_perm_commands), true);
        return $perm_commands;
    }
}
