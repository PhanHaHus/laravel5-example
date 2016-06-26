@extends('back.template')
@section('main')
<!-- Entête de page -->
@include('back.partials.entete', ['title' => trans('back/blog.dashboard'), 'icone' => 'pencil', 'fil' => link_to('productcate', 'Product cate' . ' / ' . 'Create Product cate')])
    <div class="col-sm-12">
        @yield('form')
        <div class="form-group">
            <label for="exampleInputEmail1" class="col-md-2">Danh mục</label>
            <div class="col-md-8">
                <select class="form-control" name="parentId">
                    <option value="0">Mời bạn chọn</option>
                    <?php cate_parent($parent, 0, "--", $data["prarent_id"]); ?>
                </select>
            </div>
        </div>
        {!! Form::control('text', 0, 'name', $errors, 'Name') !!}
        {!! Form::submit(trans('front/form.send')) !!}
        {!! Form::close() !!}
    </div>
@stop
@section('scripts')
@stop