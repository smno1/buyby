require 'test_helper'

class RecommendProductsControllerTest < ActionController::TestCase
  setup do
    @recommend_product = recommend_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommend_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommend_product" do
    assert_difference('RecommendProduct.count') do
      post :create, recommend_product: { active: @recommend_product.active, product_id: @recommend_product.product_id, reason: @recommend_product.reason }
    end

    assert_redirected_to recommend_product_path(assigns(:recommend_product))
  end

  test "should show recommend_product" do
    get :show, id: @recommend_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommend_product
    assert_response :success
  end

  test "should update recommend_product" do
    patch :update, id: @recommend_product, recommend_product: { active: @recommend_product.active, product_id: @recommend_product.product_id, reason: @recommend_product.reason }
    assert_redirected_to recommend_product_path(assigns(:recommend_product))
  end

  test "should destroy recommend_product" do
    assert_difference('RecommendProduct.count', -1) do
      delete :destroy, id: @recommend_product
    end

    assert_redirected_to recommend_products_path
  end
end
