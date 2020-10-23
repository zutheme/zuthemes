<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Products;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Support\MessageBag;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Auth;
use App\Posts;
use App\Impposts;
use App\PostType;
use App\category;
use App\status_type;
use App\files;
use App\size;
use App\color;
use File;
use App\func_global;

class OrdersManagementController extends Controller
{ 
    private $main_menu;
    public function listorder(Request $request,$_idstore)
    {
         //try { 
        $request->session()->forget('order_start_date');
        $request->session()->forget('order_end_date');
            $_filter = $request->get('filter');
            if(!isset($_filter)){
                $_start_date = date('Y-m-d H:i:s',strtotime("-120 days"));   
                $request->session()->put('order_start_date', $_start_date); 
                $_end_date = date('Y-m-d H:i:s');
                $request->session()->put('order_end_date', $_end_date);
            }else{
                $_start_date = $request->get('_start_date');
                $_end_date = $request->get('_end_date');
                $request->session()->put('order_start_date', $_start_date);
                $request->session()->put('order_end_date', $_end_date);
                //$request->session()->forget('order_end_date');
            }
            //$_id_post_type = $request->session()->get('id_post_type');
            $_id_status_type = $request->session()->get('order_id_status_type'); 
            if(!isset($_id_status_type)){
                $_id_status_type=1;
                session()->put('order_id_status_type',  $_id_status_type);
            }
            $errors = $_start_date.",end:".$_end_date.','.$_idstore.','.$_id_status_type;         
            $qr_orderlist = DB::select('call ListOrderProductProcedure(?,?,?,?)',array($_start_date,$_end_date, $_idstore, $_id_status_type));
            $rs_orderlist = json_decode(json_encode($qr_orderlist), true);
            return View('admin.orderlist.index')->with(compact('rs_orderlist','_idstore'));
        //} catch (\Illuminate\Database\QueryException $ex) {
            //$errors = new MessageBag(['error' => $ex->getMessage()]);
            //return View('admin.orderlist.index')->with(compact('errors'));
        //}
    }
    public function show($ordernumber,$_idstore)
    {
        $iduser = Auth::id();
        $qr_customerorder = DB::select('call InfoCustomerOrderProcedure(?)',array($ordernumber));
        $rs_customerorder = json_decode(json_encode($qr_customerorder), true);
        $qr_orderproduct = DB::select('call DetailOrderByIdorderProcedure(?,?)',array($ordernumber,$_idstore));
        $rs_orderproduct = json_decode(json_encode($qr_orderproduct), true);
        $str_select_store = $this->ListSelectAllCateByTypeId($iduser,'select','store',0);
        return View('admin.orderlist.show')->with(compact('rs_orderproduct','rs_customerorder','str_select_store','ordernumber','_idstore'));
    }
    public function moveto(Request $request, $ordernumber,$_idstore){
         $iduser = Auth::id();
         //$sel_idstore = 0;
         $_idexp = $request->get('idexp');
         $sel_idstore = $request->get('namestore');
         //foreach ($_idstore_radio as $value) {
             //$sel_idstore = $value;
         //}
        $qr_expmove = DB::select('call MoveOrderToStoreProcedure(?,?,?)',array($iduser,$_idexp,$sel_idstore));
        $rs_expmove = json_decode(json_encode($qr_expmove), true);
        $sel_idstore .= ','.$_idexp;
        $qr_customerorder = DB::select('call InfoCustomerOrderProcedure(?)',array($ordernumber));
        $rs_customerorder = json_decode(json_encode($qr_customerorder), true);
        $qr_orderproduct = DB::select('call DetailOrderByIdorderProcedure(?,?)',array($ordernumber,$_idstore));
        $rs_orderproduct = json_decode(json_encode($qr_orderproduct), true);
        $str_select_store = $this->ListSelectAllCateByTypeId($iduser,'select','store',0);
        return View('admin.orderlist.show')->with(compact('rs_orderproduct','rs_customerorder','str_select_store','ordernumber','sel_idstore','_idstore'));
    }
    public function ListSelectAllCateByTypeId( $_iduser,$_command,$_catnametype,$result) {
        $qr_cate = DB::select('call ListCatPermDashboardByTypeProcedure(?,?,?)',array($_iduser , $_command, $_catnametype));
        //$result = DB::select('call ListCatPermissionByTypeProcedure(?)',array($_catnametype));
        $categories = json_decode(json_encode($qr_cate), true);
        $this->showSelectCategories($categories, 0, 0);   
        $str_html = $this->main_menu;
        return $str_html; 
    }
    public function showSelectCategories($categories, $idparent = 0, $level = 0){
        $cate_child = array();
        foreach ($categories as $key => $item){
            if ($item['idparent'] == $idparent){
                $cate_child[] = $item;
                unset($categories[$key]);
            }
        }
        $list_cat="";       
        if ($cate_child){
            if($level == 0 ){
             $this->main_menu = '<div class="moveto"><ul class="depth-'.$level.'">';
            }else{
                $this->main_menu .= '<ul class="child depth-'.$level.'">';
            }
            foreach ($cate_child as $key => $item){    
               $route = "#";
               if(isset($item['pathroute'])&&$item['haschild'] < 1){
                    $route = $item['pathroute'];
                }
                $this->main_menu .= '<li><input name="namestore" type="radio" value="'.$item['idcategory'].'">'.$item['namecat'].'</input>';
                $this->showSelectCategories($categories, $item['idcategory'], $level+1);
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
