class OrdersController < ApplicationController

  def create
    if current_user
      quantity = params[:quantity]
      price = Product.find_by(id: params[:product_id]).price
      
      @order = Order.new(quantity: quantity, user_id: current_user.id, product_id: params[:product_id])
      @order.subtotal = @order.calc_subtotal(price)
      @order.tax = @order.calc_tax(price)
      @order.total_price = @order.calc_total(price)

      @order.save

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
