<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSuppliersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('suppliers', function (Blueprint $table) {
           $table->increments('idsupplier');
           $table->string('sku_supplier');
           $table->string('name_supp');
           $table->string('address');
           $table->Integer('idcountry')->nullable();
           $table->Integer('idprovince')->nullable();
           $table->Integer('idcitytown')->nullable();
           $table->Integer('iddistrict')->nullable();
           $table->Integer('idward')->nullable();
           $table->string('phone')->nullable();
           $table->string('website')->nullable();
           $table->string('fax')->nullable();
           $table->string('email')->nullable();
           $table->timestamp('created_at')->default(\DB::raw('CURRENT_TIMESTAMP'));
           $table->timestamp('updated_at')->default(\DB::raw('CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('suppliers');
    }
}
