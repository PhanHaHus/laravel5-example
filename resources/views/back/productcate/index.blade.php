@extends('back.template')
@section('main')
@include('back.partials.entete', ['title' => 'Product Category' . link_to_route('productcate.create', 'New Category', [], ['class' => 'btn btn-info pull-right']), 'icone' => 'pencil', 'fil' => 'Productcate'])

@if(session()->has('ok'))
@include('partials/error', ['type' => 'success', 'message' => session('ok')])
@endif

<div class="row col-lg-12">
    <div class="pull-right link">{!! $links !!}</div>
</div>
<div class="row col-lg-12">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>
                        Product Category Name
                        <a href="#" name="name" class="order">
                            <span class="fa fa-fw fa-{{ $order->name == 'posts.title' ? $order->sens : 'unsorted'}}"></span>
                        </a>
                    </th>
                    <th>
                        Created At
                        <a href="#" name="created_at" class="order">
                            <span class="fa fa-fw fa-{{ $order->name == 'posts.created_at' ? $order->sens : 'unsorted'}}"></span>
                        </a>
                    </th>
                    <th>
                        {{ trans('back/blog.published') }}
                        <a href="#" name="productcate.active" class="">
                            <span class="fa fa-fw fa-{{ $order->name == 'posts.active' ? $order->sens : 'unsorted'}}"></span>
                        </a>
                    </th> 
                    @if(session('statut') == 'admin')
                    <th>
                        {{ trans('back/blog.author') }}
                        <a href="#" name="username" class="">
                            <span class="fa fa-fw fa-{{ $order->name == 'username' ? $order->sens : 'unsorted'}}"></span>
                        </a>
                    </th>            
                    @endif
                </tr>
            </thead>
            <tbody>
                @include('back.productcate.table')
            </tbody>
        </table>
    </div>
</div>

<div class="row col-lg-12">
    <div class="pull-right link">{!! $links !!}</div>
</div>
@stop
@section('scripts')
<script>
    $(function() {
    // Sorting gestion
    $('a.order').click(function(e) {
    e.preventDefault();
            // Sorting direction
            var sens;
            if ($('span', this).hasClass('fa-unsorted')) sens = 'aucun';
            else if ($('span', this).hasClass('fa-sort-desc')) sens = 'desc';
            else if ($('span', this).hasClass('fa-sort-asc')) sens = 'asc';
            // Set to zero
            $('a.order span').removeClass().addClass('fa fa-fw fa-unsorted');
            // Adjust selected
            $('span', this).removeClass();
            var tri;
            if (sens == 'aucun' || sens == 'asc') {
    $('span', this).addClass('fa fa-fw fa-sort-desc');
            tri = 'desc';
    } else if (sens == 'desc') {
    $('span', this).addClass('fa fa-fw fa-sort-asc');
            tri = 'asc';
    }
    var name = $(this).attr('name');
            // Wait icon
            $('.breadcrumb li').append('<span id="tempo" class="fa fa-refresh fa-spin"></span>');
            // Send ajax
            $.ajax({
            url: '{{ url('productcate / order') }}',
                    type: 'GET',
                    dataType: 'json',
                    data: "name=" + name + "&sens=" + tri
            })
            .done(function(data) {
            $('tbody').html(data.view);
                    $('.link').html(data.links.replace('productcate.(.+)&sens', name));
                    $('#tempo').remove();
            })
            .fail(function() {
            $('#tempo').remove();
                    alert('{{ trans('back / blog.fail') }}');
            });
    })

    });

</script>

@stop
