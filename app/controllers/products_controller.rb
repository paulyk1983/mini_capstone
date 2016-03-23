class ProductsController < ApplicationController
  def index
    @products = Product.all
    sort = params[:sort]
    sort_order = params[:sort_order]
    random_product = params[:random_product]
   
    if sort && sort_order
      @products = Product.order(sort => sort_order)
    end
    if params["discount"]
      @products = Product.where("price < ?", 30)
    end
    render 'index.html.erb'
  end

  def show
    if params[:id] == 'random'
      products = Product.all
      @product = product.sample
    else
      @product = Product.find_by(id: params[:id])
    end
    render 'show.html.erb'
  end

  def new
  end

  def create
    product = Product.create(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      image: params[:image],
      user_id: current_user.id
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

  #def run_search
   # search_term = params[:search]
   # @products = Product.where("name LIKE ?", "%#{ search_term }%")
   # render 'index.html.erb'
  #end
end
