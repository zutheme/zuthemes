<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ReachInitSessionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE ReachInitSessionProcedure(IN _str_query varchar(255), IN _idstore int(11),IN _int_count int(11))
            BEGIN             
               DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=(_int_count-1);
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null) as (select idproduct,input_quality from tmp_product);
                select (@idorder:= @idorder + 1) as idorder,info.* from (select 0 as parent, tmp1.id, tmp1.idproduct as parent_in, tmp1.input_quality, imp1.idproduct,imp1.idcrosstype,imp1.idparentcross,imp1.amount,imp1.price_import,imp1.price,imp1.quality_sale from (SELECT * from tmp_product) as tmp1 JOIN (select * from imp_products WHERE idcrosstype = 0 and idstore = @_idstore and id_status_type = 4 and idparentcross = 0) as imp1 on tmp1.idproduct = imp1.idproduct UNION all select @_int_count as parent, tmp2.id, tmp2.idproduct as parent_in, tmp2.input_quality,imp2.idproduct,imp2.idcrosstype,imp2.idparentcross,imp2.amount,imp2.price_import,imp2.price,imp2.quality_sale from (SELECT * from temp_products) as tmp2 JOIN (select * from imp_products WHERE idstore = @_idstore and id_status_type = 4) as imp2 on tmp2.idproduct = imp2.idparentcross) as info;
                DROP TABLE tmp_product;
                DROP TABLE temp_products;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ReachInitSessionProcedure');
    }
}
