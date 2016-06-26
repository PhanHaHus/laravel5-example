<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\DatePresenter;

class ProductCategory extends Model {

    use DatePresenter;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'product_category';

    public function product(){
        return $this->hasMany('App\Models\Product');
    }

}
