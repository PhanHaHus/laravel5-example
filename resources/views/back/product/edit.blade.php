@extends('back.product.template')

@section('form')
	{!! Form::model($post, ['route' => ['product.update', $post->id], 'method' => 'put', 'class' => 'form-horizontal panel']) !!}
@stop
