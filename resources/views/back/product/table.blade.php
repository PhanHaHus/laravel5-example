@foreach ($products as $product)
    <tr {!! !$product->seen && session('statut') == 'admin'? 'class="warning"' : '' !!}>
        <td class="text-primary"><strong>{{ $product->title }}</strong></td>
        <td>{{ $product->created_at }}</td>
        <td>{!! Form::checkbox('active', $product->id, $product->active) !!}</td>
        @if(session('statut') == 'admin')
            <td>{{ $product->username }}</td>
            <td>{!! Form::checkbox('seen', $product->id, $product->seen) !!}</td>
        @endif
        <td>{!! link_to('blog/' . $product->slug, trans('back/blog.see'), ['class' => 'btn btn-success btn-block btn']) !!}</td>
        <td>{!! link_to_route('blog.edit', trans('back/blog.edit'), [$product->id], ['class' => 'btn btn-warning btn-block']) !!}</td>
        <td>
            {!! Form::open(['method' => 'DELETE', 'route' => ['blog.destroy', $product->id]]) !!}
            {!! Form::destroy(trans('back/blog.destroy'), trans('back/blog.destroy-warning')) !!}
            {!! Form::close() !!}
        </td>
    </tr>
@endforeach