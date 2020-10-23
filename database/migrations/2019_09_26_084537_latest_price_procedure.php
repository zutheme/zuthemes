<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LatestPriceProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE LatestPriceProcedure(IN `_idproduct` bigint(11), IN `_idstore` INT(11))
            BEGIN             
               SELECT info.* from (select inf1.* from (select idimp, idproduct, price, quality_sale from imp_products WHERE idproduct = _idproduct and idcrosstype = 0 and idstore = _idstore and id_status_type = 4 and idparentcross = 0 UNION all select idimp, idproduct, price, quality_sale from imp_products WHERE idparentcross = _idproduct and idcrosstype = 4 and idstore = _idstore and id_status_type = 4 ) as inf1 ORDER BY inf1.idimp DESC LIMIT 1) as info;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LatestPriceProcedure');
    }
}
