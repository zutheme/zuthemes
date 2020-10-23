<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ImportByCrossParentProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE ImportByCrossParentProcedure(IN `_idproduct` INT(11), IN `_idcustomer` INT(11), IN `_iduser` INT(11), IN `_idcrosstype` INT(11), IN `_idparentcross` INT(11), IN `_amount` DOUBLE(20,0), IN `_price_import` DOUBLE(20,0), IN `_price` DOUBLE(20,0),  IN `_quality_sale` INT(11), IN `_note` TEXT, IN `_axis_x` INT(11), IN `_axis_y` INT(11), IN `_axis_z` INT(11), IN `_id_status_type` INT(11), IN `_catnametype` VARCHAR(250), IN `_shortname` VARCHAR(250))
            BEGIN             
                DECLARE _idcattype int;
                declare _idstore int;
                set _idcattype = 0; set _idstore = 0;
                set _idcattype = (select idcattype from category_types where catnametype=_catnametype order by idcattype DESC limit 1);
                set _idstore = (select cat.idcategory from (select * from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname = _shortname);
                set @prev_id = 0;
                set @prev_id = ( SELECT MAX(idimp) as max_idimp FROM imp_products WHERE idstore = _idstore and id_status_type = 4 and idproduct = _idproduct and idcrosstype in (0,_idcrosstype) GROUP BY idproduct );
                INSERT INTO imp_products(idproduct, idcustomer, iduser, idcrosstype, idparentcross, amount, price_import, price, quality_sale, note, idstore, axis_x, axis_y, axis_z,id_status_type, prev_id) VALUES ( _idproduct, _idcustomer, _iduser, _idcrosstype, _idparentcross, _amount, _price_import, _price, _quality_sale, _note, _idstore, _axis_x, _axis_y, _axis_z,_id_status_type, @prev_id);
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ImportByCrossParentProcedure');
    }
}
