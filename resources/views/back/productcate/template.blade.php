@extends('back.template')
@section('main')
        <!-- Entête de page -->
@include('back.partials.entete', ['title' => trans('back/blog.dashboard'), 'icone' => 'pencil', 'fil' => link_to('productcate', 'Product cate' . ' / ' . 'Create Product cate')])
<div class="col-sm-12">
    @yield('form')
    <div class="form-group">
        <label for="exampleInputEmail1" class="col-md-2">Danh mục</label>
<!--        --><?php //cate_parent($parent, 0, "-->",$productcate->parent_id); ?>

        <div class="col-md-8">
            <select class="form-control" name="parentId">
                <option value="0">Mời bạn chọn</option>
                {{--if is edit--}}
                @if(isset($productcate))
                    <?php cate_parent($parent, 0, "-->",$productcate->parent_id); ?>
                @else
                {{--if is add new cate--}}
                    <?php cate_parent($data); ?>
                @endif
            </select>
        </div>
    </div>
    {!! Form::control('text', 0, 'name', $errors, 'Name') !!}
    {!! Form::control('text', 0, 'stt', $errors, 'STT') !!}
    {!! Form::submit(trans('front/form.send')) !!}
    {!! Form::close() !!}
</div>
@stop
@section('scripts')
@stop