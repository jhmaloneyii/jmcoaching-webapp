module ProductsHelper
  def cart_action_path(product)
    if @cart_action == "Add to Cart"
      add_to_cart_path(product)
    else
      remove_from_cart_path(product)
    end
  end
end
