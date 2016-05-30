@extends('back.template')
@section('main')
<!-- Entête de page -->
@include('back.partials.entete', ['title' => trans('back/blog.dashboard'), 'icone' => 'pencil', 'fil' => link_to('productcate', 'Product cate' . ' / ' . 'Create Product cate')])
    <div class="col-sm-12">
        @yield('form')
        {!! Form::control('text', 0, 'name', $errors, 'Name') !!}
        {!! Form::submit(trans('front/form.send')) !!}
        {!! Form::close() !!}
    </div>
@stop
@section('scripts')
@stop