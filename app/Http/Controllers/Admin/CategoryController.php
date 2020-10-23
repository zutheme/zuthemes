<?php







namespace App\Http\Controllers\Admin;



use App\category;



use App\CategoryType;



use Illuminate\Http\Request;



use App\Http\Controllers\Controller;



use Illuminate\Support\Facades\DB;



use App\status_type;



use App\PostType;

use Auth;

use Illuminate\Support\Facades\Route;

class CategoryController extends Controller



{



    /**



     * Display a listing of the resource.



     *



     * @return \Illuminate\Http\Response



     */



    protected $main_menu = "";



    // public function CategoryController(){



    //     $this->$main_menu = "";



    // }



    public function index(){



        $result = DB::select('call ListCategoryProcedure()');

        $categories = json_decode(json_encode($result), true);

        return view('admin.category.index',compact('categories'));

        

    }





    /**



     * Show the form for creating a new resource.



     *



     * @return \Illuminate\Http\Response



     */



    public function create(){

        $categories = $this->CheckPermission();

        $allow = $categories[0]['allow'];

        if($allow > 0 ){

            $categories = category::all()->toArray();

            $categorytypes = CategoryType::all()->toArray();

            return view('admin.category.create',compact('categories','categorytypes'));

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



        $this->validate($request,['namecat'=>'required']);
        $_namecate = $request->get('namecat');
        $title_strip = $this->stripVN($_namecate);
        $title_strip = preg_replace('/[ ](?=[ ])|[^-_,A-Za-z0-9 ]+/', '', $title_strip);
        $title_strip = strtolower($title_strip); 
        $_slug = preg_replace('/\s+/', '-', $title_strip);
        $categories = new category(['namecat'=> $request->get('namecat'),'idcattype'=>$request->get('sel_idcattype'),'idparent'=> $request->get('sel_idparent'), 'slug'=>$_slug, 'pathroute' => $request->get('pathroute')]);
        $categories->save();
        //return redirect('admin/categoryby/'.$_namecattype)->with(compact('categories'));
        return redirect()->route('admin.category.index')->with('success','data added');
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

    public function editbycatetype(Request $request, $_idcategory, $_idcattype)

    {

        $categories = $this->CheckPermission();

        $allow = $categories[0]['allow'];

        if($allow > 0 ){

            $categorybyid = category::find($_idcategory);

            $categories = category::all()->toArray();

            $categorytypes = CategoryType::all()->toArray();

            $result = DB::select('call SelCategorybyIdProcedure(?)',array($_idcategory));

            $selected = json_decode(json_encode($result), true);

            $qr_parent_cate = DB::select('call ListParentCatbyIdcattypeProcedure(?)',array($_idcattype));

            $parent_cate = json_decode(json_encode($qr_parent_cate), true);

            return view('admin.category.edit',compact('categorybyid','categories','_idcategory','categorytypes','selected','parent_cate'));

        }else{

            return view('admin.welcome.disable');

        } 



    }

    // public function edit(Request $request, $idcategory,$_namecattype)

    public function edit($idcategory,$_namecattype)

    {

        $categories = $this->CheckPermission();

        $allow = $categories[0]['allow'];

        if($allow > 0 ){

            $categorybyid = category::find($idcategory);

            $categories = category::all()->toArray();

            $categorytypes = CategoryType::all()->toArray();

            $result = DB::select('call SelCategorybyIdProcedure(?)',array($idcategory));

            $selected = json_decode(json_encode($result), true);

            $qr_parent_cate = DB::select('call ListParentCatByTypeProcedure(?)',array($_namecattype));

            $parent_cate = json_decode(json_encode($qr_parent_cate), true);

            return view('admin.category.edit',compact('categorybyid','categories','idcategory','categorytypes','selected'));

        }else{

            return view('admin.welcome.disable');

        }

    }



    public function editbynametype($idcategory,$nametypecat)

    {

        $categories = $this->CheckPermission();

        $allow = $categories[0]['allow'];

        if($allow > 0 ){

            $categorybyid = category::find($idcategory);

            $categories = category::all()->toArray();

            $categorytypes = CategoryType::all()->toArray();

            $result = DB::select('call SelCategorybyIdProcedure(?)',array($idcategory));

            $selected = json_decode(json_encode($result), true);

            //return view('admin.category.edit',compact('categorybyid','categories','idcategory','categorytypes','selected'));

            return redirect()->route('admin.category.edit')->with(compact('categorybyid','categories','idcategory','categorytypes','selected'));

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



    public function update(Request $request, $idcategory){

        $this->validate($request,['namecat'=>'required']);

        //$idcustomer = $category->idcustomer;


        $category = category::find($idcategory);

      

        $category->namecat = $request->get('namecat');

        $_namecate = $request->get('namecat');
        $title_strip = $this->stripVN($_namecate);
        $title_strip = preg_replace('/[ ](?=[ ])|[^-_,A-Za-z0-9 ]+/', '', $title_strip);
        $title_strip = strtolower($title_strip); 
        $_slug = preg_replace('/\s+/', '-', $title_strip);
        $category->slug = $_slug;
        $category->idparent = $request->get('sel_idparent');

        $idcattype = $request->get('sel_idcattype');

        $category->idcattype = $idcattype;

        $category->pathroute = $request->get('pathroute');

        $category->save();

        $cat_name_type = CategoryType::find($idcattype);

        $catnametype = $cat_name_type->catnametype;

        //return redirect()->route('admin.category.index')->with('success','data update');

        return redirect('admin/categoryby/'.$catnametype)->with('success','data update');



    }







    /**



     * Remove the specified resource from storage.



     *



     * @param  int  $id



     * @return \Illuminate\Http\Response



     */



    public function destroy($idcategory)



    {



        //$categories = category::find($idcategory);

        //$categories->delete();

        $categories = $this->CheckPermission();

        $allow = $categories[0]['allow'];

        if($allow > 0 ){
            $qr_del_cate = DB::select('call SelDelCategoryProcedure(?)',array($idcategory));
            $rs_del_cate = json_decode(json_encode($qr_del_cate), true);
            if(isset($rs_del_cate)){
                $_catenametype = $rs_del_cate[0]['catenametype'];
            }else{
                $_catenametype = 'product';
            }
            
            //return redirect()->route('admin.category.index')->with('success','record have deleted');
            return redirect('admin/categoryby/'.$_catenametype)->with('success','record have deleted');
        }else{

            return view('admin.welcome.disable');

        }



    }







    public function listcatbyidcat(){



        $input = json_decode(file_get_contents('php://input'),true);



        $idcat = $input['sel_idcategory'];



        $result = DB::select('call SellistcategorybyidProcedure(?)',array($idcat));



        $selected = json_decode(json_encode($result), true);     



        return response()->json($selected); 



    }



    public function CategoryBynametype($_namecattype){

        $rtcategories = $this->CheckPermission();

        $allow = $rtcategories[0]['allow'];

        $curent_url = $this->curent_url();  

        if($allow > 0 ){

            $statustypes = status_type::all()->toArray();

            $posttypes = PostType::all()->toArray();

            $result = DB::select('call ListAllCatByTypeProcedure(?)',array($_namecattype));

            $categories = json_decode(json_encode($result), true);

            $qr_parent_cate = DB::select('call ListParentCatByTypeProcedure(?)',array($_namecattype));

            $parent_cate = json_decode(json_encode($qr_parent_cate), true);

            $str = $this->ListAllCateByTypeId($_namecattype,0);     

            return view('admin.category.index',compact('parent_cate','posttypes','categories','statustypes','str','curent_url','rtcategories'));

        }else{

            return view('admin.welcome.disable');

        } 

 

    }



    public function createby($_namecattype){ 

        $rtcategories = $this->CheckPermission();

        $allow = $rtcategories[0]['allow'];

        //$curent_url = $this->curent_url();  

        if($allow > 0 ){

            $categories = category::all()->toArray();

            $result = DB::select('call ListAllCatByTypeProcedure(?)',array($_namecattype));

            $categories = json_decode(json_encode($result), true);

            $categorytypes = CategoryType::all()->toArray();

            return view('admin.category.create',compact('categories','categorytypes','_namecattype'));

        }else{

            return view('admin.welcome.disable');

        } 

    }



    public function storeby(Request $request,$_namecattype)

    {

        $this->validate($request,['namecat'=>'required']);
        $_namecate = $request->get('namecat');
        $title_strip = $this->stripVN($_namecate);
        $title_strip = preg_replace('/[ ](?=[ ])|[^-_,A-Za-z0-9 ]+/', '', $title_strip);
        $title_strip = strtolower($title_strip); 
        $_slug = preg_replace('/\s+/', '-', $title_strip);

        $category = new category(['namecat'=> $request->get('namecat'),'idcattype'=>$request->get('sel_idcattype'),'idparent'=> $request->get('sel_idparent'),'slug'=>$_slug , 'pathroute' => $request->get('pathroute')]);

        $category->save();

        $result = DB::select('call ListAllCatByTypeProcedure(?)',array($_namecattype));

        $categories = json_decode(json_encode($result), true);

        //return redirect()->route('admin/categoryby/'.$_namecattype)->with(compact('categories'));

         return redirect('admin/categoryby/'.$_namecattype)->with(compact('categories'));

    }



    



    public function initCategories($_namecattype)

    {



        $data = array();



        $index = array();



        //$_namecattype = "product";



        $result = DB::select('call ListAllCatByTypeProcedure(?)',array($_namecattype));



        $categories = json_decode(json_encode($result), true);



        foreach ($categories as $row) {



            $idcategory =$row["idcategory"];



            $idparent =$row["idparent"];



            $data[$idcategory]= $row;



            $index[$idparent][]=$idcategory;



        }



       $this->display_tree(0, 0, $index, $data);



       return $this->main_menu;



    }



    public function display_tree($idparent, $level, $index, $data)



    {



        //global $data, $index;



        if (isset($index[$idparent])) {



            foreach ($index[$idparent] as $id) {



                //$id = $value->idcategory;



                $this->main_menu .= str_repeat(" -", ($level*2)) . $data[$id]["namecat"] . "<br>";



                $this->display_tree($id, $level + 1,$index, $data);



            }



        }



    }

    public function category_by_idcatetype($_idcattype){

        //$input = json_decode(file_get_contents('php://input'),true);

        //$_idcattype = $input['idcattype'];

        $qr_catetype = DB::select('call CategoryByIdcatetype(?)',array($_idcattype));

        $rs_catetype = json_decode(json_encode($qr_catetype), true);

        return response()->json($rs_catetype);

    }

    public function ListCateByTypeId(Request $request, $_cattype='product', $_idcat=0) {

        $_cate_selected = array();

        $_cate_selected[0]['idcategory'] = 0;

        $result = DB::select('call ListAllCatByTypeProcedure(?)',array($_cattype));

        $categories = json_decode(json_encode($result), true);

        $str_ul="";$str_li="";

        if($_idcat > 0){

           $this->showCategories($categories, $_idcat,'',$_cate_selected);

           $s_catename = DB::select('call SelRowCategoryByIdProcedure(?)',array($_idcat));

           $r_catename = json_decode(json_encode($s_catename), true);

           foreach ($r_catename as $item) {

               //$selected = ($this->compare_in_list($_cate_selected,$item['idcategory']) >0) ? 'checked' : '';

               $str_li = '<li><input class="checklist" type="checkbox" name="list_check[]" value="'.$item['idcategory'].'">'.$item['namecat'];

            }

       }else{

           $this->showCategories($categories, 0,'',$_cate_selected);

       }      

        $str_html = '<ul class="list-check">'.$str_li.$this->main_menu."</li></ul>";

        $result = json_decode(json_encode($str_html), true);     

        return response()->json($result); 

    }

    public function ListAllCateByTypeId($_cattype='product', $_idcat=0) {

        $_cate_selected = array();

        $_cate_selected[0]['idcategory'] = 0;

        $result = DB::select('call ListAllCatByTypeProcedure(?)',array($_cattype));

        $categories = json_decode(json_encode($result), true);

        $str_ul="";$str_li="";

        if($_idcat > 0){

           $this->showCategories($categories, $_idcat,'',$_cate_selected);

           $s_catename = DB::select('call SelRowCategoryByIdProcedure(?)',array($_idcat));

           $r_catename = json_decode(json_encode($s_catename), true);

           foreach ($r_catename as $item) {

               //$selected = ($this->compare_in_list($_cate_selected,$item['idcategory']) >0) ? 'checked' : '';

               $str_li = '<li><input class="checklist" type="checkbox" name="list_check[]" value="'.$item['idcategory'].'">'.$item['namecat'];

            }

       }else{

           $this->showCategories($categories, 0,'',$_cate_selected);

       }      

        $str_html = '<ul class="list-check">'.$str_li.$this->main_menu."</li></ul>";

        return $str_html; 

    }

    public function showCategories($categories, $idparent = 0, $char = '', $_cate_selected){

        $cate_child = array();

        foreach ($categories as $key => $item)

        {

            if ($item['idparent'] == $idparent)

            {

                $cate_child[] = $item;

                unset($categories[$key]);

            }

        }

        $list_cat="";

        if ($cate_child){

            $this->main_menu .= '<ul class="list-check">';

            foreach ($cate_child as $key => $item){

                // Hiển thị tiêu đề chuyên mục

                $selected = ($this->compare_in_list($_cate_selected,$item['idcategory']) > 0) ? ' checked' : '';

                $this->main_menu .= '<li><input class="checklist" type="checkbox" name="list_check[]" value="'.$item['idcategory'].'"'.$selected.'>'.$item['namecat'];

                $this->showCategories($categories, $item['idcategory'], $char.'|---', $_cate_selected);

                $this->main_menu .= '</li>';

            }

            $this->main_menu .= '</ul>';

        }

    }

    public function compare_in_list($_cate_selected, $x = 0){

        foreach ($_cate_selected as $item){

           if($x == $item['idcategory']) return $item['idcateproduct'];

        }

        return 0;

    }

    public function curent_url(){

        $totalSegsCount = count(\Request::segments());

        $url = '';

        for ($i = 0; $i < $totalSegsCount; $i++) { 

            $url .= \Request::segment($i+1)."/";

        }

        $url = rtrim($url, '/');

        $_command = "select";

        $pattern_index = "/admin\/categoryby\/[a-z]+$/";

        $pattern_create = "/admin\/category\/createby\/[a-z]+$/";

        $pattern_edit = "/admin\/category\/editbycatetype\/[0-9]+\/[0-9]+$/";

        $pattern_delete = "/admin\/category\/[0-9]+$/";

        $matches = array();

        if (preg_match($pattern_index, $url, $matches)){

            $_command = "select";

            $url = "admin/categoryby/dashboard";

        }elseif (preg_match($pattern_create, $url, $matches)){

            $_command = "create";

            $url = "admin/category/createby/dashboard";

        }elseif (preg_match($pattern_edit, $url, $matches)){

            $_command = "edit";

            $url = "admin/category/editbycatetype/0/0";

        }elseif (preg_match($pattern_delete, $url, $matches)){

            $_command = "delete";

            $url = "admin/category/0";

        }

        $result = array('url'=>$url,'command'=>$_command);

        return $result;

    }

    public function CheckPermission(){

        $_iduser = Auth::id();

        $arr = $this->curent_url();

        $_command = $arr['command'];

        $_curent_url = $arr['url'];

        $qr_permission = DB::select('call EnableCreateNewCategoryProcedure(?,?,?,?)',array($_iduser, $_command ,'dashboard', $_curent_url));

        $permissions = json_decode(json_encode($qr_permission), true);

        return $permissions;

    }  

    public function stripVN($str) {
        $str = preg_replace("/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/", 'a', $str);
        $str = preg_replace("/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/", 'e', $str);
        $str = preg_replace("/(ì|í|ị|ỉ|ĩ)/", 'i', $str);
        $str = preg_replace("/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/", 'o', $str);
        $str = preg_replace("/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/", 'u', $str);
        $str = preg_replace("/(ỳ|ý|ỵ|ỷ|ỹ)/", 'y', $str);
        $str = preg_replace("/(đ)/", 'd', $str);

        $str = preg_replace("/(À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ)/", 'A', $str);
        $str = preg_replace("/(È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ)/", 'E', $str);
        $str = preg_replace("/(Ì|Í|Ị|Ỉ|Ĩ)/", 'I', $str);
        $str = preg_replace("/(Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ)/", 'O', $str);
        $str = preg_replace("/(Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ)/", 'U', $str);
        $str = preg_replace("/(Ỳ|Ý|Ỵ|Ỷ|Ỹ)/", 'Y', $str);
        $str = preg_replace("/(Đ)/", 'D', $str);
        return $str;
    }
    //upload file
    function base64_to_jpeg($base64_string, $output_file) {
        // open the output file for writing
        $ifp = fopen( $output_file, 'wb' ); 
        // split the string on commas
        // $data[ 0 ] == "data:image/png;base64"
        // $data[ 1 ] == <actual base64 string>
        $data = explode( ',', $base64_string );
        // we could add validation here with ensuring count( $data ) > 1
        fwrite( $ifp, base64_decode( $data[ 1 ] ) );
        // clean up the file resource
        fclose( $ifp ); 

        return $output_file; 
    }

}



