<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class OrderProductFromSessionProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    /*idnumberorder, idcrosstype, idproduct,idorder, parentidorder, idcustomer, idrecipent, iduser, amount, price, note, idstore, axis_x, axis_y, axis_z, id_status_type*/
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE OrderProductFromSessionProcedure( IN `_idcustomer` INT(11), IN `_idrecipent` INT(11), IN `_iduser` INT(11), IN `_note` TEXT CHARSET utf8mb4, IN `_fromnamestore` VARCHAR(255), IN `_tonamestore` VARCHAR(255), IN `_queryString` VARCHAR(255))
            BEGIN
                Declare _idcattype int;
                DECLARE _fromidstore int;
                DECLARE _toidstore int;
                DECLARE _idnumberorder int;
                DECLARE _axis_x INT(11);
                DECLARE _axis_y INT(11);
                DECLARE _axis_z INT(11);
                                DECLARE ordertotal DOUBLE(20,0);
                set _axis_x = 0;
                set _axis_y = 0;
                set _axis_z = 0;
                set _idcattype = (select idcattype from category_types where catnametype='store');
                set _fromidstore = (select cat.idcategory from (select idcategory,shortname from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname=_fromnamestore);
                                set _toidstore = (select cat.idcategory from (select idcategory,shortname from categories WHERE idcattype = _idcattype) as cat WHERE cat.shortname=_tonamestore);
                                DROP TABLE IF EXISTS tmp_product;
                DROP TABLE IF EXISTS temp_products;
                create TEMPORARY TABLE tmp_product(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL,id  INTEGER not NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL);
                SET @queryString = _queryString;
                    PREPARE stmt FROM @queryString;
                    EXECUTE stmt;
                    DEALLOCATE PREPARE stmt;
                    create TEMPORARY TABLE temp_products(idtmp INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY , idorder INTEGER not NULL, idcrosstype INTEGER not NULL,parent  INTEGER not NULL,id  INTEGER not NULL,input_quality  INTEGER not NULL,idproduct  INTEGER not NULL,inp_session  INTEGER not NULL,trash  INTEGER not NULL) as (SELECT * from tmp_product);
                    INSERT into listorder(note) VALUES (_note);
                    set _idnumberorder = (select LAST_INSERT_ID());
                    INSERT into exp_products(idnumberorder, idcrosstype, idproduct,idorder, parentidorder, idcustomer, idrecipent, iduser, amount, price, note, idstore, axis_x, axis_y, axis_z, id_status_type) select _idnumberorder, info.idcrosstype, info.idproduct, info.idorder, info.parent, _idcustomer, _idrecipent, _iduser, info.inp_session, (CASE WHEN info.idcrosstype = 1 THEN info.price_combo WHEN info.idcrosstype = 2 THEN info.price_gift ELSE info.price END) as price_checkout,'' as note, _toidstore, _axis_x, _axis_y, _axis_z, info.trash from (SELECT info_p.*,imp.price, imp.price_sale_origin, imp.price_combo, imp.quality_combo, imp.price_gift,imp.quality_gift FROM temp_products as info_p JOIN (select idproduct,price, price_sale_origin, price_combo, quality_combo, price_gift,quality_gift from imp_products WHERE idstore = _fromidstore) as imp on info_p.idproduct = imp.idproduct) as info;
                                        set ordertotal = (SELECT inf.ordertotal from (select idnumberorder,SUM(amount*price) as ordertotal from exp_products WHERE idnumberorder = _idnumberorder GROUP BY idnumberorder) as inf);
                                        select inp_f.*,f.urlfile,ordertotal from (select inf_p.*,phf.idfile from (select inf.*,p.namepro,p.slug,p.short_desc,p.description from (select * from exp_products WHERE idnumberorder = _idnumberorder) as inf LEFT JOIN products as p on inf.idproduct = p.idproduct) as inf_p LEFT JOIN producthasfile as phf on inf_p.idproduct = phf.idproduct) as inp_f LEFT JOIN files f on inp_f.idfile = f.idfile;
                    DROP TABLE tmp_product;
                    DROP TABLE temp_products;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS OrderProductFromSessionProcedure');
    }
}
