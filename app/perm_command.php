<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class perm_command extends Model
{
    protected $primaryKey = 'idpercommand';
    protected $fillable = ['command','description','created_at','updated_at'];
}
