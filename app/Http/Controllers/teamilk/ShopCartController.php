<?php



namespace App\Http\Controllers\teamilk;



use Illuminate\Http\Request;

use App\Http\Controllers\Controller;

use App\Products;

use Illuminate\Http\UploadedFile;

use Illuminate\Support\Facades\DB;

use App\User; 

use Illuminate\Support\Facades\Auth; 

use Validator;

use Illuminate\Support\MessageBag;

use Illuminate\Foundation\Auth\AuthenticatesUsers;

//use Auth;

use App\Posts;

use App\Impposts;

use App\PostType;

use App\category;

use App\status_type;

use App\files;

use File;

use App\sv_customer;

use App\func_global;
class ShopCartController extends Controller
{
    public function index(Request $request)
    {
    	$_namecattype="product";
        $_idstore = 31;
        $str_qr = "";$rs_lstordsess=array();$bool_str = false;
        $str_session = session()->get('orderhistory');
        if(isset($str_session)||!empty($str_session)){
            $arr = json_decode($str_session,true);
            foreach ($arr as $item) {
                if(isset($item['trash']) &&  $item['trash'] > 0) {
                    $str_qr .= '('.$item['idorder'].','.$item['idcrosstype'].','.$item['parent'].','.$item['idparentcross'].','.$item['input_quality'].','.$item['idproduct'].','.$item['inp_session'].','.$item['trash'].'),';
                    $bool_str = true;
                }
             }
       }else{
            return redirect()->to('/');
       }
       if($bool_str) {
            $str_qr = substr_replace($str_qr ,"", -1);
            $str_qr = 'INSERT into tmp_product1(idorder, idcrosstype, parent, idparentcross, input_quality, idproduct, inp_session, trash) VALUES '.$str_qr;
           //list order by array
            //$qr_lstordsess = DB::select('call LstOrderFromSessionProcedure(?,?)',array($str_qr,$_idstore));
            $qr_lstordsess = DB::select('call LstOrderFrmSessionProcedure(?,?)',array($str_qr,$_idstore));
            $rs_lstordsess = json_decode(json_encode($qr_lstordsess), true);       
       }
        return view('teamilk.addcart.shop-cart',compact('str_qr','rs_lstordsess'));
    }

    public function checkout(Request $request){

        $iduser = Auth::id();

        $qr_district = DB::select('call SelDicstrictProcedure(1)');

        $rs_district = json_decode(json_encode($qr_district), true);

        $qr_citytown = DB::select('call SelCityTownProcedure()');

        $rs_citytown = json_decode(json_encode($qr_citytown), true);

        $qr_sex = DB::select('call SelSexProcedure()');

        $rs_sex = json_decode(json_encode($qr_sex), true);
        //list product
        $_namecattype="product";
        $_idstore = 31;
        $str_qr = "";$rs_lstordsess=array();$bool_str = false;
        $arr_his = session()->get('orderhistory');
       if(isset($arr_his)||!empty($arr_his)){
            $arr = json_decode($arr_his,true);
            foreach ($arr as  $item) {
                if(isset($item['trash']) && $item['trash'] > 0) {
                    $str_qr .= '('.$item['idorder'].','.$item['idcrosstype'].','.$item['parent'].','.$item['idparentcross'].','.$item['input_quality'].','.$item['idproduct'].','.$item['inp_session'].','.$item['trash'].'),';
                    $bool_str = true;
                }
             }
       }else{
            return redirect()->to('/');
       }
       if($bool_str) {
            $str_qr = substr_replace($str_qr ,"", -1);
            $str_qr = "INSERT into tmp_product1(idorder, idcrosstype, parent, idparentcross, input_quality, idproduct, inp_session, trash) VALUES ".$str_qr;
           //list order by array
            $qr_lstordsess = DB::select('call LstOrderFrmSessionProcedure(?,?)',array($str_qr,$_idstore));
            $rs_lstordsess = json_decode(json_encode($qr_lstordsess), true);       
       }
        //end list product
        return view('teamilk.addcart.check-out',compact('rs_district','rs_citytown','rs_sex','iduser','rs_lstordsess','str_qr')); 
    }

    public function submitcheckout(Request $request){

        $_firstname = $request->get('firstname');

        $_middlename = $request->get('middlename');

        $_lastname = $request->get('lastname');

        $_address = $request->get('address');

        $_iddistrict = $request->get('sel_district');

        $_idcitytown = $request->get('sel_citytown');

        $_email = $request->get('email');

        $_phone = $request->get('phone');

        $_note = $request->get('reci_note');

        $_idcustomer = 0;

        $_iduser_curent = 0;

        $_id_reci_customer = 0;

        if(Auth::id()){

            $_iduser_curent = Auth::id();

        }   

        //check new account

        $_check_new_account = $request->get('check_new_account');

        if($_check_new_account){

            $_password = $request->get('password');

            $validator = Validator::make($request->all(), [ 

            //'name' => 'required', 
            'phone' => 'required',
            //'email' => 'required|email', 
            'password' => 'required', 
            //'c_password' => 'required|same:password', 

            ]);

            if ($validator->fails()) {

                $errors = $validator->errors();

                return redirect()->route('teamilk.addcart.check-out')->with(compact('errors'));           

            }    

            try {

                //$input = $request->all();

                $input['name'] = $_phone;

                //$input['email'] = $request->get('email');

                $input['password'] = bcrypt($_password); 

                $user = User::create($input); 

                $success['token'] =  $user->createToken('MyApp')->accessToken; 

                //$success['name'] =  $user->name;

                $_iduser_curent = $user->id;

                $creat_profile_pr = DB::select('call CreateProfileProcedure(?,?,?,?,?,?,?,?,?,?,?,?)',array($_iduser_curent,$_firstname,$_middlename,$_lastname,$_address, $_idcitytown, $_iddistrict, $_phone,'','','',''));

                //$profile = json_decode(json_encode($creat_profile_pr), true);

                //$idfile = $profile[0]['idprofile'];   

            } catch (\Illuminate\Database\QueryException $ex) {

                $errors = new MessageBag(['error' => $ex->getMessage()]);

                //return redirect()->route('teamilk.addcart.check-out')->with(compact('errors'));

                return view('teamilk.addcart.check-out',compact('errors'));

            }

        }

        else if( $_iduser_curent == 0){

            $svcustomer = new sv_customer(['firstname'=>$_firstname ,'lastname'=>$_lastname,'email'=>$_email,'mobile'=>$_phone ,'address'=>$_address,'idcitytown'=>$_idcitytown,'iddistrict'=> $_iddistrict,'job'=>'','note'=>$_note]);

            $svcustomer->save();

            $_idcustomer = $svcustomer->idcustomer;

        }  

        //check another address

        $_check_other_address = $request->get('check_other_address');

        if($_check_other_address){

            $_reci_lastname = $request->get('reci_lastname');

            $_reci_middlename = $request->get('reci_middlename');

            $_reci_firstname = $request->get('reci_firstname');

            $_reci_address = $request->get('reci_address');

            $_sel_reci_district = $request->get('sel_reci_district');

            $_sel_reci_citytown = $request->get('sel_reci_citytown');

            $_reci_email = $request->get('reci_email');

            $_reci_phone = $request->get('reci_phone');

            $reci_svcustomer = new sv_customer(['firstname'=>$_reci_firstname ,'lastname'=>$_reci_lastname,'email'=>$_reci_email,'mobile'=>$_reci_phone ,'address'=>$_reci_address,'iddcitytown'=>$_sel_reci_citytown,'iddistrict'=>$_sel_reci_district,'job'=>'','note'=>'']);

            $reci_svcustomer->save();

            $_id_reci_customer = $reci_svcustomer->idcustomer;

        }  

        

        //addcart

        $result = "success";

        $_axis_x = 0; $_axis_y = 0; $_axis_z = 0;

        $_l_idproduct = $request->get('l_idproduct');

        $_l_parent_id = $request->get('l_parent_id');

        $_l_quality = $request->get('l_quality');

        $_l_unit_price = $request->get('l_unit_price');

        $_namestore = "order";

        $ordernumber = 0;

        $count_order = 0;

        $_idstore = 31;
        $str_qr = "";$rs_lstordsess=array();$bool_str = false;
        $arr_his = session()->get('orderhistory');
       if(!empty($arr_his)){
            $arr = json_decode($arr_his,true);
            foreach ($arr as  $item) {
                if(isset($item['trash']) && $item['trash'] > 0) {
                    //$str_qr .= '('.$item['idorder'].','.$item['idcrosstype'].','.$item['parent'].','.$item['id'].','.$item['idparentcross'].','.$item['input_quality'].','.$item['idproduct'].','.$item['inp_session'].','.$item['trash'].'),';
                    $str_qr .= '('.$item['idorder'].','.$item['idcrosstype'].','.$item['parent'].','.$item['idparentcross'].','.$item['input_quality'].','.$item['idproduct'].','.$item['inp_session'].','.$item['trash'].'),';
                    $bool_str = true;
                }
             }
       }else{
            return redirect()->to('/');
       }
       if($bool_str) {
            $_fromnamestore='import';$_tonamestore='order';$_note='';
            $str_qr = substr_replace($str_qr ,"", -1);
            $str_qr = "INSERT into tmp_product1(idorder, idcrosstype, parent, idparentcross, input_quality, idproduct, inp_session, trash) VALUES ".$str_qr;
            $qr_orderproduct = DB::select('call OrderProductFromSessionProcedure(?,?,?,?,?,?,?)',array( $_idcustomer, $_id_reci_customer, $_iduser_curent,$_note,$_fromnamestore,$_tonamestore,$str_qr));
            $rs_orderproduct = json_decode(json_encode($qr_orderproduct), true);       
       }

        if($_id_reci_customer > 0) {
            $qr_customer = DB::select('call DetailCustomerProcedure(?)',array($_id_reci_customer));
            $rs_customer = json_decode(json_encode($qr_customer), true); 
        }else if( $_idcustomer > 0){
            $qr_customer = DB::select('call DetailCustomerProcedure(?)',array($_idcustomer));
            $rs_customer = json_decode(json_encode($qr_customer), true); 
        }else if($_iduser_curent > 0){
            $qr_customer = DB::select('call SelectProfileProcedure(?)',array($_iduser_curent));
            $rs_customer = json_decode(json_encode($qr_customer), true); 
        }

        $request->session()->forget('orderhistory');

        return view('teamilk.addcart.checkout-complete',compact('rs_orderproduct','rs_customer','str_qr'));

    }

    public function complete(Request $request,$ordernumber){

        $qr_shorttotal = DB::select('call ShortTotalProcedure(?)',array($ordernumber));

        $rs_shortotal = json_decode(json_encode($qr_shorttotal), true);

    	//$qr_orderproduct = DB::select('call CompleteListOrderProcedure(?)',array($ordernumber));

        //$rs_orderproduct = json_decode(json_encode($qr_orderproduct), true);

        $qr_orderproduct = DB::select('call InfoOrderProductProcedure(?)',array($ordernumber));

        $rs_orderproduct = json_decode(json_encode($qr_orderproduct), true);

        if($_id_reci_customer > 0) {

            $qr_customer = DB::select('call DetailCustomerProcedure(?)',array($_id_reci_customer));

            $rs_customer = json_decode(json_encode($qr_customer), true); 

        }else if( $_idcustomer > 0){

            $qr_customer = DB::select('call DetailCustomerProcedure(?)',array($_idcustomer));

            $rs_customer = json_decode(json_encode($qr_customer), true); 

        }else if($_iduser_curent > 0){

            $qr_customer = DB::select('call SelectProfileProcedure(?)',array($_iduser_curent));

            $rs_customer = json_decode(json_encode($qr_customer), true); 

        }

        return view('teamilk.addcart.checkout-complete',compact('rs_orderproduct','rs_customer'));

    }

}

