class CartedProductsController < ApplicationController
  def create
    quantity = params[:quantity]
    @product = Product.find_by(id: params[:product_id])
    subtotal = quantity.to_i * @product.price
    tax = subtotal * 0.09
    total = subtotal + tax
    @carted_product = CartedProduct.create(
      quantity: quantity,
      user_id: current_user.id,
      product_id: params[:product_id], 
      status: "carted"
    )
    flash[:success] = 'Product added to cart!'
    redirect_to "/carted_products"
  end

  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    if @carted_products.empty?
      flash[:warning] = "There are no items in your cart"
      redirect_to '/'      
    end
  end
end
