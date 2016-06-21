<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductTagTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_tag', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('product_id')->unsigned();
            $table->integer('tag_id')->unsigned();
        });

        Schema::table('product_tag', function(Blueprint $table) {
            $table->foreign('product_id')->references('id')->on('products')
                ->onDelete('restrict')
                ->onUpdate('restrict');
        });

        Schema::table('product_tag', function(Blueprint $table) {
            $table->foreign('tag_id')->references('id')->on('tags')
                ->onDelete('restrict')
                ->onUpdate('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_tag', function(Blueprint $table) {
            $table->dropForeign('product_tag_product_id_foreign');
        });

        Schema::table('product_tag', function(Blueprint $table) {
            $table->dropForeign('product_tag_tag_id_foreign');
        });

        Schema::drop('product_tag');
    }
}
