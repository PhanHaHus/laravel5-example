@foreach ($products as $product)
    <tr {!! !$product->seen && session('statut') == 'admin'? 'class="warning"' : '' !!}>
        <td class="text-primary"><strong>{{ $product->title }}</strong></td>
        <td>{{ $product->created_at }}</td>
        <td>{!! Form::checkbox('active', $product->id, $product->active) !!}</td>
        @if(session('statut') == 'admin')
            <td>{{ $product->username }}</td>
            <td>{!! Form::checkbox('seen', $product->id, $product->seen) !!}</td>
        @endif
        <td>{!! link_to('product/' . $product->slug, trans('back/blog.see'), ['class' => 'btn btn-success btn-block btn']) !!}</td>
        <td>{!! link_to_route('product.edit', trans('back/blog.edit'), [$product->id], ['class' => 'btn btn-warning btn-block']) !!}</td>
        <td>
            {!! Form::open(['method' => 'DELETE', 'route' => ['product.destroy', $product->id]]) !!}
            {!! Form::destroy(trans('back/blog.destroy'), trans('back/blog.destroy-warning')) !!}
            {!! Form::close() !!}
        </td>
    </tr>
@endforeach