<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ListParentCatByIdpostTypeProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE ListParentCatByIdpostTypeProcedure(IN _idperm INT(11))
                BEGIN             
                DECLARE _idcattype INT;
                SET _idcattype = (SELECT idcattype FROM category_types  WHERE catnametype LIKE _namecattype ORDER BY idcattype desc limit 1);
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
     * Reverse the migrations.IN `_namecattype` VARCHAR(255)
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared('DROP PROCEDURE IF EXISTS ListParentCatByIdpostTypeProcedure');
    }
}
