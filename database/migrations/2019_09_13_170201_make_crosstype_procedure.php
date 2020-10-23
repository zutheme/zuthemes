<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class MakeCrosstypeProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE MakeCrosstypeProcedure(IN _idproduct INT(11) ,IN _iduser INT(11), IN _idcrosstype INT(11), IN _idparentcross INT(11), IN _price INT(11), IN _quality_sale INT(11), IN _idstore int(11), IN _id_status_type int(11))
            BEGIN             
                insert into imp_products(idproduct,iduser,idcrosstype,idparentcross,price,quality_sale,idstore,id_status_type) VALUES (_idproduct, _iduser, _idcrosstype, _idparentcross, _price, _quality_sale, _idstore, _id_status_type);
                select LAST_INSERT_ID() as idimp;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS MakeCrosstypeProcedure');
    }
}
