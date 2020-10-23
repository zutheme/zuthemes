<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class SelProductCrossByIdProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE SelProductCrossByIdProcedure(IN _idproduct int(11))
            BEGIN
               select inf.*,(select urlfile from files WHERE idfile = inf.idfile ORDER BY idfile DESC limit 1) as urlfile from (SELECT imp.idproduct, imp.idcrosstype, imp.amount, imp.price_import, imp.price, imp.price_sale_origin,quality_sale,phf.idfile from (select * from imp_products where idparentcross = _idproduct) as imp LEFT JOIN producthasfile as phf on imp.idproduct = phf.idproduct) as inf;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS SelProductCrossByIdProcedure');
    }
}
