<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ListPermissionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE ListPermissionProcedure()
            BEGIN             
                SELECT p.`name`,p.description,pc.command,c.namecat FROM `permissions` as p LEFT JOIN perm_commands as pc on p.idpermcommand = pc.idpercommand LEFT JOIN categories as c on p.idcatogory = c.idcategory;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ListPermissionProcedure');
    }
}
