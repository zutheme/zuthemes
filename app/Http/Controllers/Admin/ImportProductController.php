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

class ImportProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $main_menu="";
    public function index(Request $request)
    {
       try {
            $_start_date = session()->get('start_date');
            $_end_date = session()->get('end_date');
            if(!isset($_start_date)){
                $_start_date = date('Y-m-d H:i:s',strtotime("-120 days"));
                $request->session()->put('start_date', $_start_date); 
            }
            if(!isset($_end_date)){
                $_end_date = date('Y-m-d H:i:s');
                $request->session()->put('end_date', $_end_date);
            }  

            if(!isset($_idstore)){
                $_idstore = 31;
                session()->put('idstore',  $_idstore);
            } 
            if(!isset($_idcategory)){
                $_idcategory=0;
                session()->put('idcategory',  $_idcategory);
            }
            if(!isset($_id_post_type)){
                $_id_post_type=10;
                session()->put('id_post_type',  $_id_post_type);
            }
            if(!isset($_id_status_type)){
                $_id_status_type=5;
                session()->put('id_status_type',  $_id_status_type);
            }
            $statustypes = status_type::all()->toArray();
            $post_types = PostType::all()->toArray();
            $_namecattype = 'product';
            $qr_category = DB::select('call ListParentCatByTypeProcedure(?)',array($_namecattype));
            $categories = json_decode(json_encode($qr_category), true);
            $errors = $_start_date.',end_date'.$_end_date.',idcategory:'.$_idcategory.',id_post_type:'.$_id_post_type.',id_status_type'.$_id_status_type;
            //$result = DB::select('call ListAllProductProcedure(?,?,?,?,?,?)',array($_start_date,$_end_date, $_idcategory, $_id_post_type, $_id_status_type,$_idstore));
            $result = DB::select('call ReportProductProcedure(?,?,?,?,?,?)',array('', $_id_post_type, $_id_status_type, $_idstore, $_start_date, $_end_date));
            $products = json_decode(json_encode($result), true);     
            return view('admin.importproduct.index',compact('products','errors','post_types','categories'))->with('error',$errors);

        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['error' => $ex->getMessage()]);
            return redirect()->route('admin.importproduct.index')->with('error',$errors);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
