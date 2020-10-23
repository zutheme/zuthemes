<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdatePermissionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE UpdatePermissionProcedure(IN `_name` VARCHAR(250), IN `_description` TEXT, IN _idpermcommand INT(11), IN _idcatogory INT(11), IN _idperm INT(11))
            BEGIN             
                update permissions set `name` = _name, description = _description, idpermcommand = _idpermcommand, idcatogory = _idcatogory where idperm = _idperm;
            END"
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP PROCEDURE IF EXISTS UpdatePermissionProcedure');
    }
}
