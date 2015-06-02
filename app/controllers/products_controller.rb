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

end
