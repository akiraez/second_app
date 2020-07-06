class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])

    if @order_detail.update(order_detail_params)
      @orders = @order_detail.order
      @order_detail.production_status == 3
      @orders.update(order_status: 3)
    end

    if @orders.order_details.where(production_status: 4).count == @orders.order_details.count
      @orders.update(order_status: 4)

    end
      redirect_to admin_orders_path
    end

    private

    def order_detail_params
      params.require(:order_detail).permit(:order_id, :item_id, :tax_included_price, :quantity, :production_status)
    end
  end
