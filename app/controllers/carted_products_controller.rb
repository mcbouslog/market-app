class CartedProductsController < ApplicationController

  def index
    if !current_user.carted_products.where(status: "carted").empty?
      @carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "carted")
    elsif current_user
      redirect_to "/products"
    else
      redirect_to "/users/sign_up"
    end
  end

  def create
    CartedProduct.create(user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted")
    redirect_to "/carted_products"
  end

  def destroy
    carted_product_id = params[:id]
    carted_product = CartedProduct.find_by(id: carted_product_id)
    carted_product.update(status: "removed")
    flash[:danger] = "Product removed"
    redirect_to "/carted_products"
  end

end
