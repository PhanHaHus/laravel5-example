<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;
use App\Http\Requests\ProductRequest;
use App\Http\Requests\SearchRequest;
use App\Repositories\ProductRepository;
use App\Repositories\UserRepository;

class ProductController extends Controller {

    /**
     * The ProductRepository instance.
     *
     * @var App\Repositories\ProductRepository
     */
    protected $product_gestion;

    /**
     * The UserRepository instance.
     *
     * @var App\Repositories\UserRepository
     */
    protected $user_gestion;

    /**
     * The pagination number.
     *
     * @var int
     */
    protected $nbrPages;

    /**
     * Create a new BlogController instance.
     *
     * @param  App\Repositories\ProductRepository $product_gestion
     * @param  App\Repositories\UserRepository $user_gestion
     * @return void
     */
    public function __construct(ProductRepository $product_gestion, UserRepository $user_gestion) {
        $this->user_gestion = $user_gestion;
        $this->product_gestion = $product_gestion;
        $this->nbrPages = 2;

        $this->middleware('redac', ['except' => ['indexFront', 'show', 'tag', 'search']]);
        $this->middleware('admin', ['only' => 'updateSeen']);
        $this->middleware('ajax', ['only' => ['updateSeen', 'updateActive']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function indexFront() {
        $products = $this->product_gestion->indexFront($this->nbrPages);
        $links = $products->render();

        return view('front.product.index', compact('products', 'links'));
    }

    /**
     * Display a listing of the resource.
     *
     * @return Redirection
     */
    public function index() {
        return redirect(route('product.order', [
            'name' => 'products.created_at',
            'sens' => 'asc'
        ]));
    }

    /**
     * Display a listing of the resource.
     *
     * @param  Illuminate\Http\Request $request
     * @return Response
     */
    public function indexOrder(Request $request) {
        $statut = $this->user_gestion->getStatut();
        $products = $this->product_gestion->index(
                10, $statut == 'admin' ? null : $request->user()->id, $request->name, $request->sens
        );
        
        $links = $products->appends([
            'name' => $request->name,
            'sens' => $request->sens
        ]);

        if ($request->ajax()) {
            return response()->json([
                        'view' => view('back.product.table', compact('statut', 'products'))->render(),
                        'links' => e($links->setPath('order')->render())
            ]);
        }

        $links->setPath('')->render();

        $order = (object) [
                    'name' => $request->name,
                    'sens' => 'sort-' . $request->sens
        ];

        return view('back.product.index', compact('products', 'links', 'order'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $url = config('medias.url');

        return view('back.product.create')->with(compact('url'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  App\Http\Requests\PostRequest $request
     * @return Response
     */
    public function store(PostRequest $request) {
        $this->product_gestion->store($request->all(), $request->user()->id);

        return redirect('product')->with('ok', trans('back/blog.stored'));
    }

    /**
     * Display the specified resource.
     *
     * @param  Illuminate\Contracts\Auth\Guard $auth	 
     * @param  string $slug
     * @return Response
     */
    public function show(
    Guard $auth, $slug) {
        $user = $auth->user();

        return view('front.product.show', array_merge($this->product_gestion->show($slug), compact('user')));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  App\Repositories\UserRepository $user_gestion
     * @param  int  $id
     * @return Response
     */
    public function edit(UserRepository $user_gestion, $id) {
        $post = $this->product_gestion->getByIdWithTags($id);

        $this->authorize('change', $post);

        $url = config('medias.url');

        return view('back.product.edit', array_merge($this->product_gestion->edit($post), compact('url')));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Http\Requests\PostUpdateRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(
    PostRequest $request, $id) {
        $post = $this->product_gestion->getById($id);

        $this->authorize('change', $post);

        $this->product_gestion->update($request->all(), $post);

        return redirect('product')->with('ok', trans('back/blog.updated'));
    }

    /**
     * Update "vu" for the specified resource in storage.
     *
     * @param  Illuminate\Http\Request $request
     * @param  int  $id
     * @return Response
     */
    public function updateSeen(
    Request $request, $id) {
        $this->product_gestion->updateSeen($request->all(), $id);

        return response()->json();
    }

    /**
     * Update "active" for the specified resource in storage.
     *
     * @param  Illuminate\Http\Request $request
     * @param  int  $id
     * @return Response
     */
    public function updateActive(
    Request $request, $id) {
        $post = $this->product_gestion->getById($id);

        $this->authorize('change', $post);

        $this->product_gestion->updateActive($request->all(), $id);

        return response()->json();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id) {
        $post = $this->product_gestion->getById($id);

        $this->authorize('change', $post);

        $this->product_gestion->destroy($post);

        return redirect('product')->with('ok', trans('back/blog.destroyed'));
    }

    /**
     * Get tagged products
     * 
     * @param  Illuminate\Http\Request $request
     * @return Response
     */
    public function tag(Request $request) {
        $tag = $request->input('tag');
        $products = $this->product_gestion->indexTag($this->nbrPages, $tag);
        $links = $products->appends(compact('tag'))->render();
        $info = trans('front/product.info-tag') . '<strong>' . $this->product_gestion->getTagById($tag) . '</strong>';

        return view('front.product.index', compact('products', 'links', 'info'));
    }

    /**
     * Find search in blog
     *
     * @param  App\Http\Requests\SearchRequest $request
     * @return Response
     */
    public function search(SearchRequest $request) {
        $search = $request->input('search');
        $products = $this->product_gestion->search($this->nbrPages, $search);
        $links = $products->appends(compact('search'))->render();
        $info = trans('front/blog.info-search') . '<strong>' . $search . '</strong>';

        return view('front.product.index', compact('products', 'links', 'info'));
    }

}
