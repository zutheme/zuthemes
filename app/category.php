<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class category extends Model
{
	protected $table = 'categories';
    protected $primaryKey = 'idcategory';
    protected $fillable = ['namecat','idcattype','idparent','slug','pathroute','created_at','updated_at'];
}
