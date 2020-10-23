<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class InsertCrossProductProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE InsertCrossProductProcedure(in _idproduct int(11), in _idcrosstype int(11), in _idproduct_cross int(11))
            BEGIN
               insert into cross_product(idproduct,idcrosstype,idproduct_cross) VALUES(_idproduct,_idcrosstype,_idproduct_cross);
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
        DB::unprepared('DROP PROCEDURE IF EXISTS InsertCrossProductProcedure');
    }
}
