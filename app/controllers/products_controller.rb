class ProductsController < ApplicationController
  def index
    @products = Product.all
    render 'index.html.erb'
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    render 'show.html.erb'
  end

  def new
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
    )
    flash[:success] = 'New product has been created'
    redirect_to "/products"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image]
    )
    flash[:success] = 'Product has been updated'
    redirect_to "/products/#{product_id}"    
  end

  def destroy
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.destroy
    flash[:success] = 'Product has been deleted'
    redirect_to '/products'
  end
end
