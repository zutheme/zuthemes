<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LstOrderFrmSessionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE LstOrderFrmSessionProcedure(IN `_str_query` TEXT, IN `_idstore` INT(11))
            BEGIN             
               DROP TABLE IF EXISTS tmp_product1;
                DROP TABLE IF EXISTS temp_product2;
                set @idorder:=0;
                create TEMPORARY TABLE tmp_product1(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER  NULL,parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER  NULL,idproduct  INTEGER NULL,inp_session  INTEGER  NULL,trash INTEGER  NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                create TEMPORARY TABLE temp_product2(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL, parent  INTEGER not NULL, idparentcross INTEGER NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product1);
                                SELECT inf.* from (SELECT info_p.*,p.namepro, p.short_desc, p.slug, p.description,phf.idfile,f.urlfile from (SELECT tmp_p1.*,info1.amount, info1.price_import, info1.price, info1.quality_sale from tmp_product1 as tmp_p1 LEFT JOIN (select inf1.* from (select idimp, idproduct, amount,price_import, price, quality_sale from imp_products WHERE idcrosstype = 0 and idstore = _idstore and id_status_type = 4 and idparentcross = 0 UNION all select idimp, idproduct, amount, price_import, price, quality_sale from imp_products WHERE idcrosstype = 4 and idstore = _idstore and id_status_type = 4) as inf1 ORDER BY inf1.idimp DESC LIMIT 1) as info1 on tmp_p1.idproduct = info1.idproduct UNION SELECT tmp_p2.*,info2.amount, info2.price_import, info2.price, info2.quality_sale from temp_product2 as tmp_p2 LEFT JOIN (select idimp, idproduct, idcrosstype, idparentcross, amount, price_import, price, quality_sale from imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype <> 4) as info2 on info2.idparentcross = tmp_p2.idparentcross WHERE info2.idproduct is not NULL) as info_p LEFT JOIN products as p on info_p.idproduct = p.idproduct LEFT JOIN producthasfile as phf on p.idproduct = phf.idproduct LEFT JOIN files as f on phf.idfile = f.idfile) as inf ORDER BY inf.idorder ASC;
                DROP TABLE tmp_product1;
                DROP TABLE temp_product2;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LstOrderFrmSessionProcedure');
    }
}
