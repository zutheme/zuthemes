<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DetailOrderByIdnumberOrderProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         DB::unprepared("
            CREATE PROCEDURE DetailOrderByIdnumberOrderProcedure(IN `_idnumberorder` INT(11))
            BEGIN             
               SELECT info1.*,phf1.idfile, f.urlfile,p.namepro, p.slug, p.short_desc, p.description FROM (SELECT * FROM `exp_products` WHERE idstore = 11 and id_status_type = 1 and idnumberorder = _idnumberorder) as info1 LEFT JOIN producthasfile as phf1 on info1.prev_idproducthasfile = phf1.idproducthasfile LEFT JOIN files as f on phf1.idfile = f.idfile LEFT JOIN products as p on info1.idproduct = p.idproduct; 
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
        DB::unprepared('DROP PROCEDURE IF EXISTS DetailOrderByIdnumberOrderProcedure');
    }
}
