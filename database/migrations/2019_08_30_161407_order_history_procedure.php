<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class OrderHistoryProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE OrderHistoryProcedure(IN _idproduct bigint(20), IN _quality int(11), IN _userid_order INT(11))
            BEGIN
                insert into order_history(userid_order, idproduct, quality, idcustomer) values(_userid_order, _idproduct, _quality, _idcustomer);
                SELECT LAST_INSERT_ID() as idorderhistory;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS OrderHistoryProcedure');
    }
}
