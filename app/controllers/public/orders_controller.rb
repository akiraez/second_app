class Public::OrdersController < ApplicationController
  before_action :authenticate_end_user!
  def new
    @order = Order.new
    @end_user = current_end_user
    @end_users = @end_user.adresses
  end

  def confirmation
    @order = Order.new(order_params)
    @end_user = current_end_user
    @cart_items = CartItem.all

    if params[:order][:address_option] == "0"
      @order.address = current_end_user.address
      @order.post_number = current_end_user.post_number
      @order.name = current_end_user.first_name + current_end_user.under_name

    elsif params[:order][:address_option] == "1" and params[:order][:abc].present?
      @abc = params[:order][:abc]
      @bbb = Adress.find(@abc)
      @order.address = @bbb.address
      @order.post_number = @bbb.post_number
      @order.name = @bbb.name

    elsif params[:order][:address_option] == "2"
      @order.address = params[:order][:address]
      @order.post_number = params[:order][:post_number]
      @order.name = params[:order][:name]
    else
      @order = Order.new
      @end_user = current_end_user
      @end_users = @end_user.adresses
      render :"public/orders/new"
    end
  end

  def create
    @order = Order.new(order_params)
    @cart_items = current_end_user.cart_items
    @order.save
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = cart_item.item.id
      @order_detail.tax_included_price = cart_item.item.price_excluding_tax*1.1
      @order_detail.quantity = cart_item.amount
      @order_detail.save
    end
    @cart_items.destroy_all
    redirect_to order_complete_path(@order)
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:name, :post_number, :address, :total_payment,
      :method_payment, :order_status, :end_user_id)
  end
end
