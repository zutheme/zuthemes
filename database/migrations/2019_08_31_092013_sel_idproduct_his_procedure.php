<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SelIdproductHisProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE SelIdproductHisProcedure(IN _str_query varchar(255), IN _idstore int(11))
            BEGIN
               SELECT idproduct FROM `order_history` where idorderhistory = _idhis;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS SelIdproductHisProcedure');
    }
}
