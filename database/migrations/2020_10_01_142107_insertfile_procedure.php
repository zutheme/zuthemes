<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class InsertfileProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE InsertfileProcedure(IN `_urlfile` varchar(255), IN `_name_origin` varchar(255), IN `_namefile` varchar(255), IN `_typefile` varchar(255))
            BEGIN          
                INSERT INTO files(urlfile, name_origin, namefile, typefile) VALUES ( _urlfile, _name_origin, _namefile, _typefile);
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
        DB::unprepared('DROP PROCEDURE IF EXISTS InsertfileProcedure');
    }
}
