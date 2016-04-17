class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

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
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
    @images = Image.all
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
    @product = Product.new
    @suppliers = Supplier.all
  end

  def create
    @suppliers = Supplier.all
    @product = Product.create(
      title: params[:title],
      name: params[:name],
      price: params[:price],
      description: params[:description],
      user_id: current_user.id,
      supplier_id: params[:supplier][:supplier_id]
    )
    if @product.save
      @image = Image.new(src: params[:image_src], product_id: @product.id)
      if @image.save
        flash[:success] = 'New product has been created'
        redirect_to "/products"
      else
        render 'new.html.erb'
      end
    else
      render "new.html.erb"
    end
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def update
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
    @product.update(
      title: params[:title],
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    if @product.update(title: params[:title], name: params[:name], price: params[:price], description: params[:description])
      flash[:success] = 'Product has been updated'
      redirect_to "/products/#{product_id}" 
    else
      render "edit.html.erb"
    end
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

  private

  def authenticate_admin!
    unless current_user && current_user.admin
      redirect_to '/'
    end
  end
end
