<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EditDetailByIdProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE EditDetailByIdProcedure(IN `_idproduct` INT(11), IN `_idstore` INT(11))
            BEGIN             
                select info1.*, p.namepro, p.short_desc, p.description, p.slug, imp.*, f.urlfile as url_thumbnail from (SELECT MAX(idproducthasfile) as max_idproducthasfile, idproduct from producthasfile WHERE idproduct = _idproduct and hastype = 1 and status_file = 1 GROUP BY idproduct) as info1 inner JOIN (SELECT * FROM imp_products WHERE idstore = _idstore and id_status_type = 4 and idcrosstype = 0) as imp on info1.idproduct = imp.idproduct LEFT JOIN files as f ON info1.max_idproducthasfile = f.idfile LEFT JOIN products as p on info1.idproduct =p.idproduct;
            END"
        );
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(){
        DB::unprepared('DROP PROCEDURE IF EXISTS EditDetailByIdProcedure');
    }
}
