<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LatestProductByIdcateProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE LatestProductByIdcateProcedure(IN `_idcategory` INT(11), IN `_limit` INT(11))
            BEGIN             
               SELECT info.*,p.namepro, p.slug, p.short_desc, p.description,phf.idfile,f.urlfile from (select info1.*,info2.price as price_sale from (SELECT imp.* FROM (SELECT idproduct from catehasproduct WHERE idcategory = _idcategory) as prcat LEFT JOIN (SELECT * from imp_products WHERE idstore = 31 AND id_status_type = 4 and idcrosstype = 0) as imp on prcat.idproduct = imp.idproduct WHERE imp.idproduct is not NULL) as info1 LEFT JOIN (SELECT imp.* FROM (SELECT idproduct from catehasproduct WHERE idcategory = _idcategory) as prcat LEFT JOIN (SELECT * from imp_products WHERE idstore = 31 AND id_status_type = 4 and idcrosstype = 4) as imp on prcat.idproduct = imp.idproduct WHERE imp.idproduct is not NULL) as info2 on info1.idproduct = info2.idproduct) as info LEFT JOIN products as p on info.idproduct = p.idproduct LEFT JOIN producthasfile as phf on p.idproduct = phf.idproduct LEFT JOIN files as f on phf.idfile = f.idfile ORDER BY info.idimp DESC LIMIT _limit;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LatestProductByIdcateProcedure');
    }
}
