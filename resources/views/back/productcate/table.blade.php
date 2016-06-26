@foreach ($productcate as $productca)
    <tr {!! !$productca->seen && session('statut') == 'admin'? 'class="warning"' : '' !!}>

        <td class="text-primary"><strong>{{ $productca->name }}</strong></td>
        <td>{{ $productca->created_at }}</td>
        <td>{!! link_to_route('productcate.edit', 'Edit', [$productca->id], ['class' => 'btn btn-warning btn-block']) !!}</td>
        <td>
            {!! Form::open(['method' => 'DELETE', 'route' => ['productcate.destroy', $productca->id]]) !!}
            {!! Form::destroy('Delete', trans('back/blog.destroy-warning')) !!}
            {!! Form::close() !!}
        </td>
    </tr>
@endforeach