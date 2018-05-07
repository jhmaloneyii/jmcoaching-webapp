class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, except: [:show]

  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
  end

  def add
    $redis.sadd current_user_cart, @product.id
  end

  def remove
    $redis.srem current_user_cart, @product.id
  end

  private

  def current_user_cart
    "cart#{current_user.id}"
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
