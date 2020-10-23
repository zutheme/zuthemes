<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ListProductComboProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE ListProductComboProcedure()
            BEGIN             
               select info.*,f.urlfile from (select inf.*,phf.idfile FROM (select imp.*,p.idproduct,p.namepro,p.slug,p.short_desc,p.description from (SELECT DISTINCT idparentcross from imp_products WHERE idcrosstype = 1 and idstore = 31 and id_status_type = 4) as imp LEFT JOIN products as p on imp.idparentcross = p.idproduct) as inf LEFT JOIN producthasfile as phf on inf.idparentcross = phf.idproduct) as info LEFT JOIN files as f on info.idfile = f.idfile order by idproduct DESC limit 10;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ListProductComboProcedure');
    }
}
