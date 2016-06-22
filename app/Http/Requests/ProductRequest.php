<?php

namespace App\Http\Requests;

use App\Models\Product;

class ProductRequest extends Request {

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        $id = $this->product ? ',' . $this->product : '';
        return [
            'title' => 'required|max:255',
            'summary' => 'required|max:65000',
            'content' => 'required|max:65000',
            'product_cate_id' => 'required',
            'slug' => 'required|unique:products,slug' . $id,
            'tags' => 'tags'
        ];
    }

}
