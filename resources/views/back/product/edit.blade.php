@extends('back.product.template')

@section('form')
	{!! Form::model($product, ['route' => ['product.update', $product->id], 'method' => 'put', 'class' => 'form-horizontal panel']) !!}
@stop
