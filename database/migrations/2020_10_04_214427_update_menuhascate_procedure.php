<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateMenuhascateProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE update_menu_hascate_procedure(IN `str_sql` text,IN `idmenu` int)
            BEGIN          
                DROP TABLE IF EXISTS tmp_product1;
                create TEMPORARY TABLE tmp_product1(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idmenuhascate INTEGER not NULL, idcategory INTEGER  NULL,idparent  INTEGER not NULL, depth INTEGER NULL, reorder  INTEGER  NULL,trash INTEGER NULL);
                SET @queryString = CONCAT('INSERT into tmp_product1(idmenuhascate, idcategory, idparent, depth, reorder, trash) VALUES ', str_sql);
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                                UPDATE menu_has_cate as mhc JOIN tmp_product1 as tmp ON  mhc.idmenuhascate = tmp.idmenuhascate
                                SET mhc.idmenu = idmenu, mhc.idcategory = tmp.idcategory, mhc.idparent = tmp.idparent, mhc.depth = tmp.depth, mhc.reorder = tmp.reorder, mhc.trash = tmp.trash;
                DROP TABLE tmp_product1;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS update_menu_hascate_procedure');
    }
}
