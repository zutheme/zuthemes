<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class SelDelCategoryProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE SelDelCategoryProcedure(IN `_idcategory` int)
            BEGIN          
                update categories set trash = 1 where idcategory = _idcategory;
                SELECT (select catnametype from category_types where idcattype = c.idcattype) as catenametype FROM categories as c where c.idcategory = _idcategory;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS SelDelCategoryProcedure');
    }
}
