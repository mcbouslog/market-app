class ProductsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show, :search]

  def index
    @products = Product.all
    #ascending/descending
    if params[:sort]
      @products = @products.order(params[:sort] => params[:sort_order])
    end
    #discount    
    if params[:discount]
      @products = @products.where("price < ?", params[:discount])
    end
    #category    
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
  end

  def show
    if params[:id] == "random"
      products = Product.all
      @product = products.sample
    else
    @product = Product.find_by(id: params[:id])
    end
  end

  def new
    @product = Product.new
    @product_image = ProductImage.new
  end

  def create
    @product = Product.new(name: params[:name], price: params[:price], description: params[:description], supplier_id: params[:supplier_id])
    
    @product_image = ProductImage.new(product_id: @product.id, image_url: params[:image_url_1])

    if @product.save && @product_image.save
      flash[:success] = "Product created"
      redirect_to "/products/#{@product.id}"
    else
      render "products/new"    
    end

  end 

  def edit
    @product_id = params[:id]
    @product = Product.find_by(id: params[:id])  
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.update(name: params[:name], price: params[:price], description: params[:description])
    flash[:info] = "Product Edited"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    flash[:danger] = "Product deleted"
    redirect_to "/"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

  def authenticate_admin!
    unless user_signed_in? && current_user.admin
      redirect_to "/"
    end
  end

end
