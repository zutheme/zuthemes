<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class SelIdproductBySlugProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE SelIdproductBySlugProcedure(IN `_slug` varchar(255))
            BEGIN
                SET @slug = CONCAT(_slug, '%');          
                select idproduct from products WHERE slug like @slug limit 1;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS SelIdproductBySlugProcedure');
    }
}
