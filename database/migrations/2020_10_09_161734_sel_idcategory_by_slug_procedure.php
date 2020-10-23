<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class SelIdcategoryBySlugProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE SelIdcategoryBySlugProcedure(IN `_slug` varchar(255))
            BEGIN
                SET @slug = CONCAT(_slug, '%');          
                select idcategory from categories WHERE slug like @slug limit 1;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS SelIdcategoryBySlugProcedure');
    }
}
