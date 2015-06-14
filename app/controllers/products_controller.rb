class ProductsController < ApplicationController

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
  end

  def create
    @product = Product.create(name: params[:name], price: params[:price], description: params[:description], supplier_id: params[:supplier_id])
    
    ProductImage.create(product_id: @product.id, image_url: params[:image_url_1])

    flash[:success] = "Product created"
    redirect_to "/products/#{@product.id}"
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
    redirect_to "/products"
  end

  def search
    search_term = params[:search]
    @products = Product.where("name LIKE ?", "%#{search_term}%")
    render :index
  end

end
