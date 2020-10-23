<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class LatestPromotionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE LatestPromotionProcedure(IN `_idstore` INT(11), IN `_limit` INT(11))
            BEGIN             
                SELECT info.*, info_pr.max_idimp_price,p.namepro, p.slug, p.short_desc, p.description,imp1.*, imp2.price as old_price, phf.idfile, f.urlfile FROM (SELECT inf1.idproduct,inf2.max_idproducthasfile from (SELECT idproduct from imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype = 4 GROUP BY idproduct) as inf1 LEFT JOIN (SELECT MAX(idproducthasfile) as max_idproducthasfile,idproduct FROM producthasfile WHERE hastype = 1 and status_file = 1 GROUP BY idproduct) as inf2 on inf1.idproduct = inf2.idproduct WHERE inf2.idproduct is not NULL) as info LEFT JOIN (SELECT MAX(idimp) as max_idimp_price,idproduct from (SELECT * FROM `imp_products` WHERE idstore = 31 AND id_status_type = 4 and idcrosstype in (0,4)) as inf_price GROUP BY inf_price.idproduct) as info_pr ON info.idproduct = info_pr.idproduct LEFT JOIN products as p on info.idproduct = p.idproduct LEFT JOIN imp_products as imp1 on info_pr.max_idimp_price = imp1.idimp LEFT JOIN  imp_products as imp2 on imp1.prev_id = imp2.idimp LEFT JOIN producthasfile as phf on info.max_idproducthasfile = phf.idproducthasfile LEFT JOIN files as f on phf.idfile = f.idfile limit _limit;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS LatestPromotionProcedure');
    }
}
