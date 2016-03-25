class OrdersController < ApplicationController
  def create
    @carted_products = current_user.carted_products.where(status: "carted")
    subtotal = 0

    @carted_products.each do |carted_product|
      product_total = carted_product.quantity * carted_product.product.price
      subtotal = subtotal + product_total
    end
  
    tax = subtotal * 0.09
    total = tax + subtotal

    @order = Order.create(
      user_id: current_user.id, 
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
