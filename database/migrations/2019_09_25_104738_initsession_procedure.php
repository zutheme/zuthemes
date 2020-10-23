<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class InitsessionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE InitsessionProcedure(IN _idproduct bigint(11), IN _input_quality int(11), IN _idstore int(11),IN _int_count int(11))
            BEGIN             
               set @idorder:=(_int_count-1);
               SELECT (@idorder:= @idorder + 1) as idorder, info.* FROM (select info1.* from (select idimp, 0 as parent, _idproduct as parent_in, input_quality , idproduct, idcrosstype, idparentcross, amount,price_import, price, quality_sale from imp_products WHERE idproduct = _idproduct and idcrosstype = 0 and idstore = _idstore and id_status_type = 4 and idparentcross = 0 UNION all select idimp, 0 as parent, _idproduct as parent_in, input_quality, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idparentcross = _idproduct and idcrosstype = 4 and idstore = _idstore and id_status_type = 4 ORDER BY idimp DESC LIMIT 1) as info1 UNION select idimp, _int_count as parent, _idproduct as parent_in, input_quality, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype <> 4 and idparentcross = _idproduct) as info;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS InitsessionProcedure');
    }
}
