<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LstParentByIdcattypeProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE LstParentByIdcattypeProcedure(IN `_idcattype` INT(11))
            BEGIN             
                IF _idcattype > 0 THEN
                BEGIN
                   SELECT c.idcategory, c.namecat FROM categories as c WHERE c.idcattype = _idcattype and c.idparent = 0;
                END; 
                ELSE
                BEGIN
                   SELECT c.* FROM categories as c;    
                END;
                END IF; 
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LstParentByIdcattypeProcedure');
    }
}
