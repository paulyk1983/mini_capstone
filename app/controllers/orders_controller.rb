class OrdersController < ApplicationController
  def create
    quantity = params[:quantity]
    @product = Product.find_by(id: params[:product_id])
    subtotal = quantity.to_i * @product.price
    tax = subtotal * 0.09
    total = subtotal + tax
    @order = Order.create(
      quantity: quantity,
      user_id: current_user.id,
      product_id: params[:product_id], 
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    flash[:success] = 'Order successfully created!'
    redirect_to "/orders/#{@order.id}"
  end

  def show
    @order = Order.last
    @image = Image.find_by(product_id: @order.product_id)
  end
end
