<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProductByIdposttypeIdcateProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE ProductByIdposttypeIdcateProcedure(IN `_idcategory` INT(11), IN `_idstore` INT(11), IN `_limit` INT(11), IN `_idposttype` INT(11))
                BEGIN             
                SELECT inf1.*, imp1.*, imp2.price as old_price, phf.max_idproducthasfile, phf1.idfile, f.urlfile, p.namepro, p.slug, p.short_desc, p.description from (SELECT pc.*, info_pr.max_idimp_price from (SELECT idproduct FROM catehasproduct WHERE idcategory = _idcategory and checked > 0) as pc LEFT JOIN (SELECT MAX(idimp) as max_idimp_price, idproduct from (SELECT * FROM `imp_products` WHERE idstore = _idstore AND id_status_type = 4 and idcrosstype in (0,4)) as inf_price GROUP BY inf_price.idproduct) as info_pr ON pc.idproduct = info_pr.idproduct WHERE info_pr.idproduct is not NULL) as inf1 LEFT JOIN imp_products as imp1 on inf1.max_idimp_price = imp1.idimp LEFT JOIN imp_products as imp2 ON imp1.prev_id = imp2.idimp LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct FROM producthasfile WHERE hastype = 1 and status_file = 1 GROUP BY idproduct) as phf on inf1.idproduct = phf.idproduct LEFT JOIN producthasfile as phf1 on phf.max_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on inf1.idproduct = p.idproduct and p.id_post_type = _idposttype ORDER BY imp1.idimp DESC limit _limit;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ProductByIdposttypeIdcateProcedure');
    }
}
