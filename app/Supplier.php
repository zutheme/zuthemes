<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    protected $primaryKey = 'idsupp';
    protected $fillable = ['idsupplier','sku_supplier','name_supp','address','idcountry','idprovince','idcitytown','iddistrict','idward','phone','website','fax','email','created_at','updated_at'];
}
