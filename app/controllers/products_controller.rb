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
    Product.create(name: params[:name], price: params[:price], description: params[:description], image: params[:image])
  end

  def edit
    @product_id = params[:id]
    @product = Product.find_by(id: params[:id])  
  end

  def update
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.update(name: params[:name], price: params[:price], description: params[:description], image: params[:image])
  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
  end

end
