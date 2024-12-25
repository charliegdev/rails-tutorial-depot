# frozen_string_literal: true

require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end

  test 'should get index' do
    get carts_url
    assert_response :success
  end

  test 'should get new' do
    get new_cart_url
    assert_response :success
  end

  test 'should create cart' do
    assert_difference('Cart.count', 1) do
      post carts_url, params: { cart: {} }
    end

    assert_redirected_to cart_url(Cart.last)
  end

  test 'should show cart' do
    skip 'Skipping because of the play test result - does not allow user to see another cart not belonging to themselves'
    get cart_url(@cart)
    assert_response :success
  end

  test 'should get edit' do
    get edit_cart_url(@cart)
    assert_response :success
  end

  test 'should update cart' do
    patch cart_url(@cart), params: { cart: {} }
    assert_redirected_to cart_url(@cart)
  end

  test 'should destroy cart' do
    post line_items_url, params: { product_id: products(:ruby).id }
    @cart = Cart.find(session[:cart_id])

    assert_difference('Cart.count', -1) do
      delete cart_url(@cart)
    end

    assert_redirected_to store_index_url
  end

  test 'should handle unique products added to cart' do
    # Create a cart
    post line_items_url, params: { product_id: products(:ruby).id }
    post line_items_url, params: { product_id: products(:two).id }

    # Add a new item to that cart
    @cart = Cart.find(session[:cart_id])
    assert_equal @cart.line_items.count, 2
    assert_equal @cart.line_items.find_by(product_id: products(:ruby).id).quantity, 1
    assert_equal @cart.line_items.find_by(product_id: products(:two).id).quantity, 1
  end

  test 'should handle duplicate products added to cart' do
    # Create a cart
    post line_items_url, params: { product_id: products(:ruby).id }
    post line_items_url, params: { product_id: products(:ruby).id }

    # Add a new item to that cart
    @cart = Cart.find(session[:cart_id])
    assert_equal @cart.line_items.count, 1
    assert_equal @cart.line_items.find_by(product_id: products(:ruby).id).quantity, 2
  end
end
