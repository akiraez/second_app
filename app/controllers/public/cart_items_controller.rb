class Public::CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @current_cart_items = current_end_user.cart_items
    if @current_cart_items.find_by(item_id: params[:cart_item][:item_id]).present? and params[:cart_item][:amount].to_i >=1
      @result = @current_cart_items.find_by(item_id: params[:cart_item][:item_id]).amount + params[:cart_item][:amount].to_i
      @current_cart_items.find_by(item_id: params[:cart_item][:item_id]).update(amount: @result)
      redirect_to cart_items_path
    elsif
      @cart_item = CartItem.new(cart_item_params) and params[:cart_item][:amount].to_i >=1
      @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find_by(id: params[:cart_item][:item_id])
      @end_user = current_end_user
      @cart_item = CartItem.new
      render :'public/items/show'
    end
  end

  def index
    @end_user = current_end_user
    @cart_items = @end_user.cart_items
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

  def cart_item_params
     params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
  end

end
