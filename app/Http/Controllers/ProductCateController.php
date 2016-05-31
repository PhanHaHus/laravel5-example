<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;
use App\Http\Requests\ProductCateRequest;
use App\Http\Requests\SearchRequest;
use App\Repositories\ProductCateRepository;
use App\Repositories\UserRepository;

class ProductCateController extends Controller {

    /**
     * The BlogRepository instance.
     *
     * @var App\Repositories\BlogRepository
     */
    protected $blog_gestion;

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
     * @param  App\Repositories\BlogRepository $blog_gestion
     * @param  App\Repositories\UserRepository $user_gestion
     * @return void
     */
    public function __construct(ProductCateRepository $blog_gestion, UserRepository $user_gestion) {
        $this->user_gestion = $user_gestion;
        $this->blog_gestion = $blog_gestion;
        $this->nbrPages = 2;

        $this->middleware('redac', ['except' => ['indexFront', 'show', 'tag', 'search']]);
        $this->middleware('admin', ['only' => 'updateSeen']);
        $this->middleware('ajax', ['only' => ['updateSeen', 'updateActive']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Redirection
     */
    public function index() {
        return redirect(route('productcate.order', [
            'name' => 'created_at',
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
        $productcate = $this->blog_gestion->index(
                10, $request->name
        );
        $links = $productcate->appends([
            'name' => $request->name,
            'sens' => $request->sens
        ]);

        if ($request->ajax()) {
            return response()->json([
                    'view' => view('back.productcate.table', compact('statut', 'productcate'))->render(),
                    'links' => e($links->setPath('order')->render())
            ]);
        }

        $links->setPath('')->render();

        $order = (object) [
                    'name' => $request->name,
                    'sens' => 'sort-' . $request->sens
        ];

        return view('back.productcate.index', compact('productcate', 'links', 'order'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $url = config('medias.url');
        return view('back.productcate.create')->with(compact('url'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  App\Http\Requests\ProductCateRequest $request
     * @return Response
     */
    public function store(ProductCateRequest $request) {
        $this->blog_gestion->store($request->all(), $request->user()->id);

        return redirect('productcate')->with('ok', trans('back/blog.stored'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  App\Repositories\UserRepository $user_gestion
     * @param  int  $id
     * @return Response
     */
    public function edit(UserRepository $user_gestion, $id) {
        $productcate = $this->blog_gestion->getById($id);
        $url = config('medias.url');
        return view('back.productcate.edit', array_merge($this->blog_gestion->edit($productcate), compact('url')));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  App\Http\Requests\PostUpdateRequest $request
     * @param  int  $id
     * @return Response
     */
    public function update(ProductCateRequest $request, $id) {
        $productcate = $this->blog_gestion->getById($id);

        $this->blog_gestion->update($request->all(), $productcate);

        return redirect('productcate')->with('ok', trans('back/blog.updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id) {
        $productcate = $this->blog_gestion->getById($id);
        $this->blog_gestion->destroy($productcate);
        return redirect('productcate')->with('ok', trans('back/blog.destroyed'));
    }

}
