<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SelProductByIdimpProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE SelProductByIdimpProcedure(IN _idimp int(11))
            BEGIN
               select idproduct,idcrosstype,idparentcross,price,quality_sale from imp_products WHERE idimp = _idimp;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS SelProductByIdimpProcedure');
    }
}
