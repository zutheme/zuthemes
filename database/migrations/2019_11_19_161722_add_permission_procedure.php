<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPermissionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE AddPermissionProcedure(IN `_name` VARCHAR(250), IN `_description` TEXT, IN _idpermcommand INT(11), IN _idcatogory INT(11))
            BEGIN             
                INSERT into permissions(`name`,description,idpermcommand,idcatogory) VALUES (_name, _description, _idpermcommand, _idcatogory);
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
        DB::unprepared('DROP PROCEDURE IF EXISTS AddPermissionProcedure');
    }
}
