class OrdersController < ApplicationController

  def create
    if current_user
      
      order = Order.create(user_id: current_user.id)

      @ordered_products = current_user.carted_products.where(status: "carted")
      
      @order_subtotal = 0
      @order_tax = 0
      @order_total_price = 0
      
      @ordered_products.each do |ordered_product|

        price = ordered_product.product.price
        quantity = ordered_product.quantity

        @order_subtotal += ordered_product.calc_subtotal(price)
        @order_tax += ordered_product.calc_tax(price)
        @order_total_price += ordered_product.calc_total(price)

        ordered_product.update(status: "purchased", order_id: order.id)
      end
      
      order.update(subtotal: @order_subtotal, tax: @order_tax, total_price: @order_total_price)

      redirect_to "/orders/#{order.id}"
    else
      redirect_to "/users/sign_up"
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    @ordered_products = current_user.carted_products.where(order_id: @order.id)
  end

end
