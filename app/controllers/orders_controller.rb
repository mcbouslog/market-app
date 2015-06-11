class OrdersController < ApplicationController

  def create
    if current_user
      @product = Product.find_by(id: params[:product_id])
      @order = Order.create(quantity: params[:quantity], user_id: current_user.id, product_id: params[:product_id], subtotal: (@product.price * params[:quantity].to_i), tax: (@product.sales_tax * params[:quantity].to_i), total_price: (@product.total * params[:quantity].to_i))
      redirect_to "/orders/#{@order.id}"
    else
      redirect_to "/users/sign_up"
    end
  end

  def show
    @order = Order.find_by(id: params[:order_id])
    @user = User.find_by(id: @order.user_id)
  end

end
