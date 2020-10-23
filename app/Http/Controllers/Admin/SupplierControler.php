<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;
use Illuminate\Support\MessageBag;
use App\Supplier;
use Illuminate\Support\Facades\DB;
class SupplierControler extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suppliers = Supplier::all()->toArray();
        return view('admin.supplier.index',compact('suppliers'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.supplier.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $validator = Validator::make($request->all(), ['idsupplier' => 'required','sku_supplier' => 'required','name_supp' => 'required']);
        if ($validator->fails()) { 
            $errors = $validator->errors();
            return redirect()->route('admin.supplier.create')->with(compact('errors'));           
        }  
        try {
            $input = $request->all();
            $role = Supplier::create($input); 
        } catch (\Illuminate\Database\QueryException $ex) {
            $errors = new MessageBag(['errorlogin' => $ex->getMessage()]);
            return redirect()->back()->withInput()->withErrors($errors);
        }
        return redirect()->route('admin.supplier.index')->with('success','data added');
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
    public function edit($idsupplier)
    {
        $suppliers = Supplier::find($idsupplier);
        return view('admin.supplier.edit',compact('suppliers','idsupplier'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $idsupplier)
    {
         $validator = Validator::make($request->all(), ['idsupplier' => 'required','sku_supplier' => 'required','name_supp' => 'required']);
        $suppliers = Supplier::find($idsupplier);
        $suppliers->idsupplier = $request->get('idsupplier');
        $suppliers->sku_supplier = $request->get('sku_supplier');
        $suppliers->name_supp = $request->get('name_supp');
        $suppliers->address = $request->get('address'); 
        $suppliers->idcountry = $request->get('idcountry');
        $suppliers->idprovince = $request->get('idprovince'); 
        $suppliers->idcitytown = $request->get('idcitytown'); 
        $suppliers->iddistrict = $request->get('iddistrict');  
        $suppliers->idward = $request->get('idward');
        $suppliers->phone = $request->get('phone');
        $suppliers->website = $request->get('website');
        $suppliers->fax = $request->get('fax');
        $suppliers->email = $request->get('email');
        $suppliers->save();
        return redirect()->route('admin.supplier.index')->with('success','data update');
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
