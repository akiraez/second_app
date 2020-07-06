class Public::ItemsController < ApplicationController
  before_action :authenticate_end_user!,except: [:top]

  def top
  end

  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @end_user = current_end_user
  end
end
