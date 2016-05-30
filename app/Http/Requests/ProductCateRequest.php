<?php

namespace App\Http\Requests;

use App\Models\Post;

class ProductCateRequest extends Request {
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules() {
        $id = $this->productcate ? ',' . $this->productcate : '';
        return [
            'name' => 'required|max:255',
        ];
    }

}
