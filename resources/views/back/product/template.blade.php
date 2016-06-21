@extends('back.template')

@section('head')

{!! HTML::style('ckeditor/plugins/codesnippet/lib/highlight/styles/default.css') !!}

@stop

@section('main')

<!-- Entête de page -->
@include('back.partials.entete', ['title' => "Product Dashboard", 'icone' => 'pencil', 'fil' => link_to('product', trans('back/blog.posts')) . ' / ' . trans('back/blog.creation')])

<div class="col-sm-12">
    @yield('form')

    <div class="form-group checkbox pull-right">
        <label>
            {!! Form::checkbox('active','1',true) !!}
            {{ trans('back/blog.published') }}
        </label>
    </div>

    {!! Form::control('text', 0, 'title', $errors, trans('back/blog.title')) !!}

    <div class="form-group {!! $errors->has('slug') ? 'has-error' : '' !!}">
        {!! Form::label('slug', trans('back/blog.permalink'), ['class' => 'control-label']) !!}
        {!! url('/') . '/product/' . Form::text('slug', null, ['id' => 'permalien']) !!}
        <small class="text-danger">{!! $errors->first('slug') !!}</small>
    </div>


    {!! Form::select('size', array('L' => 'Large', 'S' => 'Small'), 'S') !!}
    {!! Form::control('textarea', 0, 'summary', $errors, trans('back/blog.summary')) !!}
    {!! Form::control('textarea', 0, 'content', $errors, trans('back/blog.content')) !!}
    {!! Form::control('text', 0, 'tags', $errors, trans('back/blog.tags'), isset($tags)? implode(',', $tags) : '') !!}

    <button type="button" onclick="BrowseServer('image');">Pick Image</button>
    <input type="text" id="image"/>

    {!! Form::submit(trans('front/form.send')) !!}
    {!! Form::close() !!}
</div>

@stop

@section('scripts')

{!! HTML::script('ckeditor/ckeditor.js') !!}

{{--pick image to text box--}}
<script type="text/javascript">
    // File Picker modification for FCK Editor v2.0 - www.fckeditor.net
    // by: Pete Forde <pete@unspace.ca> @ Unspace Interactive
    var urlobj;
    function BrowseServer(obj)
    {
        urlobj = obj;
        OpenServerBrowser(
                '{!! url($url) !!}',
                screen.width * 0.7,
                screen.height * 0.7 ) ;
    }
    function OpenServerBrowser( url, width, height )
    {
        var iLeft = (screen.width - width) / 2 ;
        var iTop = (screen.height - height) / 2 ;
        var sOptions = "toolbar=no,status=no,resizable=yes,dependent=yes" ;
        sOptions += ",width=" + width ;
        sOptions += ",height=" + height ;
        sOptions += ",left=" + iLeft ;
        sOptions += ",top=" + iTop ;
        var oWindow = window.open( url, "BrowseWindow", sOptions ) ;
    }
    function SetUrl( url, width, height, alt )
    {
        document.getElementById(urlobj).value = url ;
        oWindow = null;
    }
</script>
{{-------------------}}
<script>

    var config = {
        codeSnippet_theme: 'Monokai',
        language: '{{ config('app.locale') }}',
        height: 100,
        filebrowserBrowseUrl: '{!! url($url) !!}',
        toolbarGroups: [
            {name: 'clipboard', groups: ['clipboard', 'undo']},
            {name: 'editing', groups: ['find', 'selection', 'spellchecker']},
            {name: 'links'},
            {name: 'insert'},
            {name: 'forms'},
            {name: 'tools'},
            {name: 'document', groups: ['mode', 'document', 'doctools']},
            {name: 'others'},
            //'/',
            {name: 'basicstyles', groups: ['basicstyles', 'cleanup']},
            {name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi']},
            {name: 'styles'},
            {name: 'colors'}
        ]
    };
    config.extraPlugins = 'videodetector';

    CKEDITOR.replace('summary', config);

    config['height'] = 400;

    CKEDITOR.replace('content', config);

    $("#title").keyup(function () {
        var str = sansAccent($(this).val());
        str = str.replace(/[^a-zA-Z0-9\s]/g, "");
        str = str.toLowerCase();
        str = str.replace(/\s/g, '-');
        $("#permalien").val(str);
    });

</script>

@stop