@extends('back.productcate.template')

@section('form')
{!! Form::model($productcate, ['route' => ['productcate.update', $productcate->id], 'method' => 'put', 'class' => 'form-horizontal panel']) !!}
@stop
