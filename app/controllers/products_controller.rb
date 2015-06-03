class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new  
  end

  def create
    product = Product.create(name: params[:name], price: params[:price], description: params[:description], image: params[:image])
    flash[:success] = "Product created"
    redirect_to "/products/#{product.id}"
  end 

  def edit
    @product_id = params[:id]
    @product = Product.find_by(id: params[:id])  
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.update(name: params[:name], price: params[:price], description: params[:description], image: params[:image])
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

end
