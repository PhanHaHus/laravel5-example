<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Presenters\DatePresenter;

class Product extends Model {

    use DatePresenter;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'products';

    /**
     * Many to Many relation
     *
     * @return Illuminate\Database\Eloquent\Relations\belongToMany
     */
    public function tags() {
        return $this->belongsToMany('App\Models\Tag');
    }

    /**
     * One to Many relation
     *
     * @return Illuminate\Database\Eloquent\Relations\hasMany
     */
    public function comments() {
        return $this->hasMany('App\Models\Comment');
    }
    public function cate(){
        return $this->belongsTo('App\Models\Category');
    }

    public function danhgia(){
        return $this->hasMany('App\Models\Danhgia');
    }
    public function chitiethoadon(){
        return $this->hasMany('App\Models\chitiethoadon');
    }
}
