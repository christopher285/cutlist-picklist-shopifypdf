require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { body_html: @product.body_html, created_at: @product.created_at, handle: @product.handle, id: @product.id, images: @product.images, metafields_global_description_tag: @product.metafields_global_description_tag, metafields_global_title_tag: @product.metafields_global_title_tag, options: @product.options, product_type: @product.product_type, published_at: @product.published_at, published_scope: @product.published_scope, tags: @product.tags, template_suffix: @product.template_suffix, title: @product.title, updated_at: @product.updated_at, variants: @product.variants, vendor: @product.vendor }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { body_html: @product.body_html, created_at: @product.created_at, handle: @product.handle, id: @product.id, images: @product.images, metafields_global_description_tag: @product.metafields_global_description_tag, metafields_global_title_tag: @product.metafields_global_title_tag, options: @product.options, product_type: @product.product_type, published_at: @product.published_at, published_scope: @product.published_scope, tags: @product.tags, template_suffix: @product.template_suffix, title: @product.title, updated_at: @product.updated_at, variants: @product.variants, vendor: @product.vendor }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
