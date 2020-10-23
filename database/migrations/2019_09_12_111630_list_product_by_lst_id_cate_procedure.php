<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ListProductByLstIdCateProcedure extends Migration
{
    /**
     * Run the migrations.
     * set @_str_query = "insert INTO tmp_cate(idcate) VALUES (6),(10),(17)";
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE ListProductByLstIdCateProcedure(IN _str_query TEXT)
            BEGIN             
                DROP TABLE IF EXISTS tmp_cate;
                create TEMPORARY TABLE tmp_cate(idtmpcate INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idcate INTEGER not NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                select info.idproduct,info.namepro,f.urlfile from (SELECT info_phf.*,phf.idfile from (select info_p.idproduct,p.namepro from (SELECT DISTINCT idproduct from catehasproduct as chp join tmp_cate as tmp_c on tmp_c.idcate = chp.idcategory) as info_p join products as p on info_p.idproduct = p.idproduct) as info_phf LEFT JOIN (SELECT * from producthasfile WHERE hastype = 1 ORDER BY idproducthasfile DESC) as phf on phf.idproduct = info_phf.idproduct) as info LEFT JOIN files as f on info.idfile = f.idfile LIMIT 50;
                DROP TABLE tmp_cate;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ListProductByLstIdCateProcedure');
    }
}
