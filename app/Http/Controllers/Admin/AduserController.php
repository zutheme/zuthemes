<?php
namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User; 
use Illuminate\Support\Facades\Auth; 
use Validator;
use Illuminate\Support\MessageBag;
use App\Department;
use Illuminate\Support\Facades\DB;
use App\profile;
use App\CategoryType;
class AduserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        //$_namecattype="website";
        //$rs_catbytype = DB::select('call ListAllCatByTypeProcedure(?)',array($_namecattype));
        //$catbytypes = json_decode(json_encode($rs_catbytype), true);
        //$users = User::all()->toArray();
        //return view('admin.aduser.index',compact('users','catbytypes'));
        $users = $this->CheckPermission();
        $allow = $users[0]['allow'];
        if($allow > 0 ){
             return view('admin.aduser.index',compact('users'));
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
        $users = $this->CheckPermission();
        $allow = $users[0]['allow'];
        if($allow > 0 ){
            //DB::select('call ListSelEmpDepartProcedure(?)',array($id));
            $result = DB::select('call ListAllCatByTypeProcedure(?)',array('department'));
            $categorytypes = json_decode(json_encode($result), true);
            //$categorytypes = CategoryType::all()->toArray();
            //$perm_commands = perm_command::all()->toArray();
            return view('admin.aduser.create',compact('categorytypes'));
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
        $validator = Validator::make($request->all(), [ 
            'name' => 'required', 
            //'email' => 'required|email', 
            'password' => 'required', 
            'c_password' => 'required|same:password', 
        ]);
        if ($validator->fails()) { 
            $errors = $validator->errors();
            return redirect()->route('admin.aduser.create')->with(compact('errors'));           
        }
        try {
            $input = $request->all(); 
            $input['password'] = bcrypt($input['password']); 
            $user = User::create($input); 
            $success['token'] =  $user->createToken('MyApp')->accessToken; 
            $success['name'] =  $user->name;
            $iduser = $user->id;
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return redirect()->route('admin.aduser.create')->with(compact('errors'));
        }
        $message="";
        $values="";
        $list_checks = $request->input('list_check');
        $sql = "INSERT INTO `depart_employees`( `iduser`, `iddepart`) VALUES";
            if($list_checks){
                foreach ($list_checks as $iddepart) {
                  $values .= "(".$iduser.",".$iddepart."),";   
                } 
            }
        $values=rtrim($values,", ");
        $sql = $sql.$values;
        $result = DB::select($sql);
        $firstname = "";
        $middlename = "";
        $lastname = "";
        $address = "";
        $mobile = "";
        $about = "";
        $facebook = "";
        $zalo = "";
        $url_avatar = "";
        $_idcitytown = 1; $_iddistrict = 1;
        $creat_profile_pr = DB::select('call CreateProfileProcedure(?,?,?,?,?,?,?,?,?,?,?,?)',array($iduser,$firstname,$middlename,$lastname,$address,$_idcitytown,$_iddistrict,$mobile,$about,$facebook,$zalo,$url_avatar));
        $profile = json_decode(json_encode($creat_profile_pr), true);
        $idfile = $profile[0]['idprofile'];    
        return redirect()->route('admin.aduser.index')->with(compact('idfile'));
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
    public function edit($id)
    {
        $users = $this->CheckPermission();
        $allow = $users[0]['allow'];
        if($allow > 0 ){
            $users = User::find($id);
            //$result = DB::select('call ListDepartParentProcedure()');
            //$departparents = json_decode(json_encode($result), true);
            //$rs_empdepart_seleted = DB::select('call ListSelEmpDepartProcedure(?)',array($id));
            //$l_empdepart_seleted = json_decode(json_encode($rs_empdepart_seleted), true);
            $result = DB::select('call ListAllCatByTypeProcedure(?)',array('department'));
            $categorytypes = json_decode(json_encode($result), true);
            return view('admin.aduser.edit',compact('users','id','categorytypes'));
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
    public function update(Request $request, $id)
    {
        $users = user::find($id);
        $validator = Validator::make($request->all(), [ 
            'password' => 'required', 
            'c_password' => 'required|same:password', 
        ]);
        if ($validator->fails()) { 
            $errors = $validator->errors();
            return redirect()->route('admin.aduser.edit')->with(compact('errors'));           
        }
        $input = $request->all(); 
        $input['password'] = bcrypt($input['password']); 
        $users->password =  $input['password'];
        $users->save();
        return redirect()->route('admin.aduser.index')->with('success','data update');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        //$users = User::find($id);
        //$users->delete();
        $users = $this->CheckPermission();
        $allow = $users[0]['allow'];
        if($allow > 0 ){
            try {
                $qr_delete_user = DB::select('call DeleteUserProcedure(?)',array($id));
                $rs_delete_user = json_decode(json_encode($qr_delete_user), true);
            } catch (\Illuminate\Database\QueryException $ex) {
                $errors = new MessageBag(['error' => $ex->getMessage()]);
                //return redirect()->route('admin.aduser.create')->with('error',$errors);
                return redirect()->route('admin.aduser.index')->with(compact('errors'));
            }       
            return redirect()->route('admin.aduser.index')->with('success','record have deleted');
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
        $pattern_index = "/admin\/aduser$/";
        $pattern_create = "/admin\/aduser\/create$/";
        $pattern_edit = "/admin\/aduser\/[0-9]+\/edit$/";
        $pattern_delete = "/admin\/aduser\/[0-9]+$/";
        $matches = array();
        if (preg_match($pattern_index, $url, $matches)){
            $_command = "select";
            $url = "admin/aduser";
        }elseif (preg_match($pattern_create, $url, $matches)){
            $_command = "create";
            $url = "admin/aduser/create";
        }elseif (preg_match($pattern_edit, $url, $matches)){
            $_command = "edit";
            $url = "admin/aduser/0/edit";
        }elseif (preg_match($pattern_delete, $url, $matches)){
            $_command = "delete";
            $url = "admin/aduser/0";
        }
        $result = array('url'=>$url,'command'=>$_command);
        return $result;
    }
    public function CheckPermission(){
        $_iduser = Auth::id();
        $arr = $this->curent_url();
        $_command = $arr['command'];
        $_curent_url = $arr['url'];
        $qr_permission = DB::select('call EnableAddUserProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard', $_curent_url));
        $permissions = json_decode(json_encode($qr_permission), true);
        return $permissions;
    } 
     //show sub category
    private $main_menu;
    public function catebyidcatetype($_idcatetype) {
        $qr_catebytype = DB::select('call ListAllCateByIdcatetype(?)',array($_idcatetype));
        $categories = json_decode(json_encode($qr_catebytype), true);
        $this->showCategory($categories,0);
        $result =  $this->main_menu;
        return response()->json(array('success' => true, 'result' => $result), 200);
    }
    public function showCategory($categories, $idparent = 0){
        $cate_child = array();
        foreach ($categories as $key => $item) {
            if ($item['idparent'] == $idparent){
                $cate_child[] = $item;
                unset($categories[$key]);
            }
        }
        $list_cat="";     
        if($cate_child) {
            $checked='';
            $this->main_menu .= '<ul class="list-check">';
            foreach ($cate_child as $key => $item){
                $this->main_menu .= '<li><input class="array-parent" type="hidden" value="'.$idparent.'">';
                // if(in_array($item['idcategory'], $_cate_selected)){
                //      $checked='checked';
                // }
                $this->main_menu .= '<input name="list_check[]" class="array-check" type="checkbox" value="'.$item['idcategory'].'"><label>'.$item['namecat'].'</label>';
                $this->showCategory($categories, $item['idcategory']);
                $this->main_menu .= '</li>';
            }
            $this->main_menu .= '</ul>';
        }
    } 
}