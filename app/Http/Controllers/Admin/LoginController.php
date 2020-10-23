<?php
namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use App\Http\Requests;
use Validator;
use Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\MessageBag;
class LoginController extends Controller
{
    private $main_menu = '';
    public function checklogin(){
      if (Auth::check()) {
          $user = Auth::user(); 
          $iduser = Auth::id(); 
          $str_dashboard = $this->ListAllCateByTypeId($iduser,'select','dashboard',0);
          session()->put('sidebar-admin', $str_dashboard);
          //profile
           $qr_select_profile = DB::select('call SelectProfileProcedure(?)',array($iduser));
           $profile = json_encode($qr_select_profile);
           session()->put('profile', $profile);
          //$str_session = session()->get('sidebar-admin');
          return view('admin.welcome.loginsuccess');
           //return redirect()->route('admin.welcome.loginsuccess')->with('success',$user->name);
      } else {
        //return route('login');
          return redirect('admin/login');
      }
    }
    public function logout(){
        Auth::logout();
        
        return redirect('admin/login');
    }
    public function getLogin()
    {
        if (Auth::check()) {
            $user = Auth::user(); 
            return view('admin.welcome.loginsuccess');
            //return redirect()->route('admin.welcome.loginsuccess')->with('success',$user->name);
        } else {
            return view('admin.login');
        }

    }
    
    public function postLogin(Request $request) {
      $rules = [
        'name' =>'required',
        //'email' =>'required|email',
        'password' => 'required|min:8'
      ];
      $messages = [
        //'email.required' => 'Email là trường bắt buộc',
        //'email.email' => 'Email không đúng định dạng',
        'name.required' => 'Tên đăng nhập là trường bắt buộc',
        'password.required' => 'Mật khẩu là trường bắt buộc',
        'password.min' => 'Mật khẩu phải chứa ít nhất 8 ký tự',
      ];
      $validator = Validator::make($request->all(), $rules, $messages);
      if ($validator->fails()) {
        return redirect()->back()->withErrors($validator)->withInput();
      } else {
        //$email = $request->input('email');
        $name = $request->input('name');
        $password = $request->input('password');
        //if( Auth::attempt(['email' => $email, 'password' =>$password])) {
        if( Auth::attempt(['name' => $name, 'password' =>$password])) {
           $user = Auth::user();
           $iduser = Auth::id(); 
           $success['token'] =  $user->createToken('MyApp')->accessToken;
           $str_dashboard = $this->ListAllCateByTypeId($iduser,'select','dashboard',0);
           session()->put('sidebar-admin', $str_dashboard);
           //select store move       
           //profile
           $qr_select_profile = DB::select('call SelectProfileProcedure(?)',array($iduser));
           $profile = json_encode($qr_select_profile);
           session()->put('profile', $profile);
           return view('admin.welcome.loginsuccess');
           //return redirect()->route('admin.welcome.loginsuccess')->with('success',$user->name);
        } else {
          $errors = new MessageBag(['errorlogin' => 'Email hoặc mật khẩu không đúng']);
          return redirect()->back()->withInput()->withErrors($errors);
        }
      }
    }
    public function ListAllCateByTypeId( $_iduser,$_command,$_catnametype,$result) {
        $qr_cate = DB::select('call ListCatPermDashboardByTypeProcedure(?,?,?)',array($_iduser , $_command, $_catnametype));
        //$result = DB::select('call ListCatPermissionByTypeProcedure(?)',array($_catnametype));
        $categories = json_decode(json_encode($qr_cate), true);
        if(!isset($categories)){
          return redirect('/');
        }
        $this->showCategories($categories, 0, 0);   
        $str_html = $this->main_menu;
        return $str_html; 
    }
    public function showCategories($categories, $idparent = 0, $level = 0){
        $cate_child = array();
        foreach ($categories as $key => $item){
            if (isset($item['idparent']) && $item['idparent'] == $idparent){
                $cate_child[] = $item;
                unset($categories[$key]);
            }
        }
        $list_cat="";       
        if ($cate_child){
            if($level == 0 ){
             $this->main_menu = '<div class="menu_section"><ul class="nav side-menu depth-'.$level.'">';
            }else{
                $this->main_menu .= '<ul class="nav child_menu depth-'.$level.'">';
            }
            foreach ($cate_child as $key => $item){    
               $route = "#";
               if(isset($item['pathroute'])&&$item['haschild'] < 1){
                    $route = $item['pathroute'];
                }
                $this->main_menu .= '<li><a href="'.asset($route).'">'.$item['namecat'].'</a>';
                $this->showCategories($categories, $item['idcategory'], $level+1);
                $this->main_menu .= '</li>';
            }
            if($level == 0){
                $this->main_menu .= '</ul></div>';
            }else{
                $this->main_menu .= '</ul>';
            }
            
        }
    }
    
}
