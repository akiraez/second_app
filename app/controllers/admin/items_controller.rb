class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save(item_params)
      redirect_to admin_items_path
    else
      @item = Item.new
      @genres = Genre.all
      render :'admin/items/new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image, :genre_id, :price_excluding_tax, :is_active_sale_status)
  end

end
