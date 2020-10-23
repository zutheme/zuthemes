<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LstOrdSessionProcedure extends Migration
{
    /**
     * Run the migrations.
     * SET @queryString = "INSERT into tmp_product(idproduct) VALUES (1),(1),(8),(8),(12),(15)";
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE LstOrdSessionProcedure(IN _str_query varchar(255), IN _idstore int(11))
            BEGIN
                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                create TEMPORARY TABLE tmp_product(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_products(id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idproduct INTEGER not NULL) as (select idproduct from tmp_product);
                select rs_info.* from (select inf.*,f.urlfile from (select al_info.*,phf.idfile FROM (select info_pro.namepro,info_pro.slug,info_pro.short_desc,info_pro.description,info_pro.idcrosstype,info_pro.parent,info_pro.id,imp.* from (select al_pros.*,0 as idcrosstype ,0 as parent from (select p.idproduct,p.namepro,p.slug,p.short_desc,p.description,tmp_prs.id from temp_products as tmp_prs JOIN products as p on tmp_prs.idproduct = p.idproduct) as al_pros UNION all select al_pro.* from (select p.idproduct,p.namepro,p.slug,p.short_desc,p.description,pr.idcrosstype,pr.parent,pr.id from (select cp.idproduct,cp.idcrosstype,cp.idproduct_cross,tmp_p.id as parent,tmp_p.id from tmp_product as tmp_p join cross_product as cp on tmp_p.idproduct = cp.idproduct) as pr join products as p on pr.idproduct_cross = p.idproduct) as al_pro ) as info_pro join (select * from imp_products WHERE idstore = _idstore) as imp on info_pro.idproduct = imp.idproduct) as al_info LEFT JOIN producthasfile as phf on al_info.idproduct = phf.idproduct) as inf LEFT JOIN files as f on inf.idfile = f.idfile) as rs_info;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LstOrdSessionProcedure');
    }
}
