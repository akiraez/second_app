class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    @end_user = @order.end_user
    @end_users = @order.end_user.first_name + @order.end_user.under_name
    @orders = @end_user.orders

      @orders.each do |order|
      @full_address = order.post_number + order.name + order.address
    end
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details

    if @order.update(order_params)
      @order.order_status == 2
      @order_details.update(production_status: 2)
      redirect_to admin_orders_path
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :post_number, :address, :total_payment,
      :method_payment, :order_status, :end_user_id)
  end
end
