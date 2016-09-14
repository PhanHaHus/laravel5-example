<?php

namespace App\Http\Controllers;

use App\Jobs\ChangeLocale;
use App\Models\ProductCategory;
use App\Models\Product;

class HomeController extends Controller {

    /**
     * Display the home page.
     *
     * @return Response
     */
    public function index() {
        $product = ProductCategory::with('product')->get();
        foreach($product as $pro){
            if($pro->product){
                var_dump($pro->product);
            }
        }
        die;
        return view('front.index');
    }

    /**
     * Change language.
     *
     * @param  App\Jobs\ChangeLocaleCommand $changeLocale
     * @param  String $lang
     * @return Response
     */
    public function language($lang, ChangeLocale $changeLocale) {
        $lang = in_array($lang, config('app.languages')) ? $lang : config('app.fallback_locale');
        $changeLocale->lang = $lang;
        $this->dispatch($changeLocale);

        return redirect()->back();
    }

}
