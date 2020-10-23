<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateImpProductProcedure extends Migration
{
    /**
     * Run the migrations.
     * set @_str_query = "INSERT into tmp_import(idimp, idcrosstype, price, quality_sale) VALUES (2,1,2000000,10),(60,1,1100000,10)";
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE UpdateImpProductProcedure(IN _str_query TEXT)
            BEGIN
                DROP TABLE IF EXISTS tmp_import;
                create TEMPORARY TABLE tmp_import(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idimp INTEGER not NULL, idcrosstype INTEGER not NULL, price INTEGER not NULL, quality_sale  INTEGER not NULL);
                SET @queryString = _str_query;
                PREPARE stmt FROM @queryString;
                EXECUTE stmt;
                DEALLOCATE PREPARE stmt;
                update imp_products as imp JOIN tmp_import as tmp_imp on imp.idimp = tmp_imp.idimp 
                set imp.idcrosstype = tmp_imp.idcrosstype, imp.price = tmp_imp.price, imp.quality_sale = tmp_imp.quality_sale
                WHERE imp.idimp > 0;
                DROP TABLE tmp_import;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS UpdateImpProductProcedure');
    }
}
