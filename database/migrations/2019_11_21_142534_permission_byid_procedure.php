<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class PermissionByidProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE PermissionByidProcedure(IN _idperm INT(11))
            BEGIN             
                SELECT p.*,c.idcattype FROM (SELECT * from permissions WHERE idperm = _idperm) as p LEFT JOIN categories as c on p.idcatogory = c.idcategory;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS PermissionByidProcedure');
    }
}
