<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class ListAllProductProcedure extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
            CREATE PROCEDURE ListAllProductProcedure(IN _start_date VARCHAR(255), IN _end_date VARCHAR(255), IN _idcategory INT(11), IN _id_post_type INT(11), IN _id_status_type INT(11), IN _idstore int(11))
            BEGIN
               select al_info.*,GROUP_CONCAT(al_info.namecat SEPARATOR ', ') as listcat from (select a_info.*,(select namecat from categories where idcategory = a_info.idcategory) as namecat FROM (select info.*,(select urlfile from files where idfile=info.idfile) as urlfile from (select p.*,imp.*,(select idcategory FROM catehasproduct WHERE idproduct = p.idpro) as idcategory,(select `name` from users where id = imp.iduser) as author,(select idfile from producthasfile WHERE idproduct = p.idpro and hastype = 1 ORDER BY idproducthasfile desc LIMIT 1) as idfile from (SELECT idproduct as idpro,namepro,slug,short_desc,description,id_post_type,idsize,idcolor,idcrosstype,idparent,idstatus_type FROM `products` WHERE created_at BETWEEN _start_date AND _end_date) as p join (select * from imp_products where idstore = _idstore) as imp on p.idpro = imp.idproduct) as info) as a_info) as al_info GROUP BY al_info.idproduct DESC LIMIT 100;
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
        DB::unprepared('DROP PROCEDURE IF EXISTS ListAllProductProcedure');
    }
}
