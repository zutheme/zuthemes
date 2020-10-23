<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LstOrderFromSessionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE LstOrderFromSessionProcedure(IN _str_query varchar(255), IN _idstore int(11))
            BEGIN
               DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                set @idorder:=0;
                create TEMPORARY TABLE tmp_product(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL,id  INTEGER not NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL,id  INTEGER not NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product);
                select info_u.*,f.urlfile from (select info_f.*,phf.idfile from (SELECT info_p.*,imp.price, imp.price_sale_origin, imp.price_combo, imp.price_gift FROM (select tmp_p.*,p.namepro,p.slug,p.short_desc,p.description from temp_products tmp_p JOIN products as p on tmp_p.idproduct = p.idproduct) as info_p JOIN (select idproduct,price, price_sale_origin, price_combo, price_gift from imp_products WHERE idstore = _idstore) as imp on info_p.idproduct = imp.idproduct) as info_f LEFT JOIN (SELECT * from producthasfile WHERE hastype=1) as phf on info_f.idproduct = phf.idproduct) as info_u LEFT JOIN files as f on info_u.idproduct = f.idfile;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LstOrderFromSessionProcedure');
    }
}
