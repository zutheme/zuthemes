<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LoadOrderInitSessionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE LoadOrderInitSessionProcedure(IN _str_query varchar(255), IN _idstore int(11))
            BEGIN
                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=0;
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL, input_quality INTEGER not null) as (select idproduct,input_quality from tmp_product);
                select (@idorder:= @idorder + 1) as idorder, info_pro.idcrosstype,info_pro.parent,info_pro.id,info_pro.input_quality,imp.*,(CASE WHEN info_pro.idcrosstype = 1 THEN info_pro.input_quality*imp.quality_combo WHEN info_pro.idcrosstype = 2 THEN info_pro.input_quality*imp.quality_gift ELSE info_pro.input_quality END) as inp_session from (select al_pros.*,0 as parent,0 as idcrosstype from (select p.idproduct,tmp_prs.id,tmp_prs.input_quality from temp_products as tmp_prs JOIN products as p on tmp_prs.idproduct = p.idproduct) as al_pros UNION all select al_pro.* from (select p.idproduct,pr.id, pr.input_quality,pr.parent,pr.idcrosstype from (select cp.idproduct,cp.idcrosstype,cp.idproduct_cross,tmp_p.id as parent,tmp_p.id, tmp_p.input_quality from tmp_product as tmp_p join cross_product as cp on tmp_p.idproduct = cp.idproduct) as pr join products as p on pr.idproduct_cross = p.idproduct) as al_pro) as info_pro join (select idproduct,price,price_gift,quality_gift,price_combo,quality_combo from imp_products WHERE idstore = _idstore) as imp on info_pro.idproduct = imp.idproduct;
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
         DB::unprepared('DROP PROCEDURE IF EXISTS LoadOrderInitSessionProcedure');
    }
}
