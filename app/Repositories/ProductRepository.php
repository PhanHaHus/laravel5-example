<?php

namespace App\Repositories;

use App\Models\Product,
    App\Models\Tag,
    App\Models\Comment;

class ProductRepository extends BaseRepository
{

    /**
     * The Tag instance.
     *
     * @var App\Models\Tag
     */
    protected $tag;

    /**
     * The Comment instance.
     *
     * @var App\Models\Comment
     */
    protected $comment;

    /**
     * Create a new BlogRepository instance.
     *
     * @param  App\Models\Product $product
     * @param  App\Models\Tag $tag
     * @param  App\Models\Comment $comment
     * @return void
     */
    public function __construct(
        Product $product, Tag $tag, Comment $comment)
    {
        $this->model = $product;
        $this->tag = $tag;
        $this->comment = $comment;
    }

    /**
     * Create or update a Product.
     *
     * @param  App\Models\Product $product
     * @param  array $inputs
     * @param  bool $user_id
     * @return App\Models\Product
     */
    private function saveProduct($product, $inputs, $user_id = null)
    {
        $manyImage = $inputs['manyImage'];
        $manyImage= array_filter(explode(",",$manyImage));
        $product->title = $inputs['title'];
        $product->summary = $inputs['summary'];
        $product->content = $inputs['content'];
        $product->slug = $inputs['slug'];
        $product->category_id = $inputs['product_cate_id'];
        $product->active = isset($inputs['active']);
        if ($user_id) {
            $product->user_id = $user_id;
        }
        $product->save();

        return $product;
    }

    /**
     * Create a query for Product.
     *
     * @return Illuminate\Database\Eloquent\Builder
     */
    private function queryActiveWithUserOrderByDate()
    {
        return $this->model
            ->select('id', 'created_at', 'updated_at', 'title', 'slug', 'user_id', 'summary')
            ->whereActive(true)
            ->with('user')
            ->latest();
    }

    /**
     * Get Product collection.
     *
     * @param  int $n
     * @return Illuminate\Support\Collection
     */
    public function indexFront($n)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->paginate($n);
    }

    /**
     * Get Product collection.
     *
     * @param  int $n
     * @param  int $id
     * @return Illuminate\Support\Collection
     */
    public function indexTag($n, $id)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->whereHas('tags', function ($q) use ($id) {
            $q->where('tags.id', $id);
        })
            ->paginate($n);
    }

    /**
     * Get search collection.
     *
     * @param  int $n
     * @param  string $search
     * @return Illuminate\Support\Collection
     */
    public function search($n, $search)
    {
        $query = $this->queryActiveWithUserOrderByDate();

        return $query->where(function ($q) use ($search) {
            $q->where('summary', 'like', "%$search%")
                ->orWhere('content', 'like', "%$search%")
                ->orWhere('title', 'like', "%$search%");
        })->paginate($n);
    }

    /**
     * Get Product collection.
     *
     * @param  int $n
     * @param  int $user_id
     * @param  string $orderby
     * @param  string $direction
     * @return Illuminate\Support\Collection
     */
    public function index($n, $user_id = null, $orderby = 'created_at', $direction = 'desc')
    {
        $query = $this->model
            ->select('products.id', 'products.created_at', 'title', 'products.seen', 'active', 'user_id', 'slug', 'username')
            ->join('users', 'users.id', '=', 'products.user_id')
            ->orderBy($orderby, $direction);

        if ($user_id) {
            $query->where('user_id', $user_id);
        }

        return $query->paginate($n);
    }

    /**
     * Get Product collection.
     *
     * @param  string $slug
     * @return array
     */
    public function show($slug)
    {
        $product = $this->model->with('user', 'tags')->whereSlug($slug)->firstOrFail();

        $comments = $this->comment
            ->whereProduct_id($product->id)
            ->with('user')
            ->whereHas('user', function ($q) {
                $q->whereValid(true);
            })
            ->get();

        return compact('product', 'comments');
    }

    /**
     * Get product collection
     * @return array
     */
    public function edit($product)
    {
        $tags = [];

        foreach ($product->tags as $tag) {
            array_push($tags, $tag->tag);
        }

        return compact('product', 'tags');
    }

    /**
     * Get Product collection.
     *
     * @param  int $id
     * @return array
     */
    public function GetByIdWithTags($id)
    {
        return $this->model->with('tags')->findOrFail($id);
    }

    /**
     * Update a Product.
     *
     * @param  array $inputs
     * @param  App\Models\Product $product
     * @return void
     */
    public function update($inputs, $product)
    {
        $product = $this->saveProduct($product, $inputs);

        // Tag gestion
        $tags_id = [];
        if (array_key_exists('tags', $inputs) && $inputs['tags'] != '') {

            $tags = explode(',', $inputs['tags']);

            foreach ($tags as $tag) {
                $tag_ref = $this->tag->whereTag($tag)->first();
                if (is_null($tag_ref)) {
                    $tag_ref = new $this->tag();
                    $tag_ref->tag = $tag;
                    $tag_ref->save();
                }
                array_push($tags_id, $tag_ref->id);
            }
        }

        $product->tags()->sync($tags_id);
    }

    /**
     * Update "seen" in Product.
     *
     * @param  array $inputs
     * @param  int $id
     * @return void
     */
    public function updateSeen($inputs, $id)
    {
        $product = $this->getById($id);

        $product->seen = $inputs['seen'] == 'true';

        $product->save();
    }

    /**
     * Update "active" in Product.
     *
     * @param  array $inputs
     * @param  int $id
     * @return void
     */
    public function updateActive($inputs, $id)
    {
        $product = $this->getById($id);

        $product->active = $inputs['active'] == 'true';

        $product->save();
    }

    /**
     * Create a Product.
     *
     * @param  array $inputs
     * @param  int $user_id
     * @return void
     */
    public function store($inputs, $user_id)
    {
        $product = $this->saveProduct(new $this->model, $inputs, $user_id);

        // Tags gestion
        if (array_key_exists('tags', $inputs) && $inputs['tags'] != '') {

            $tags = explode(',', $inputs['tags']);

            foreach ($tags as $tag) {
                $tag_ref = $this->tag->whereTag($tag)->first();
                if (is_null($tag_ref)) {
                    $tag_ref = new $this->tag();
                    $tag_ref->tag = $tag;
                    $product->tags()->save($tag_ref);
                } else {
                    $product->tags()->attach($tag_ref->id);
                }
            }
        }

        // Maybe purge orphan tags...
    }

    /**
     * Destroy a Product.
     *
     * @param  App\Models\Product $product
     * @return void
     */
    public function destroy($product)
    {
        $product->tags()->detach();

        $product->delete();
    }

    /**
     * Get Product slug.
     *
     * @param  int $comment_id
     * @return string
     */
    public function getSlug($comment_id)
    {
        return $this->comment->findOrFail($comment_id)->Product->slug;
    }

    /**
     * Get tag name by id.
     *
     * @param  int $tag_id
     * @return string
     */
    public function getTagById($tag_id)
    {
        return $this->tag->findOrFail($tag_id)->tag;
    }

}
