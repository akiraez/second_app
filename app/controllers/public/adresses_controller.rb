class Public::AdressesController < ApplicationController
  before_action :authenticate_end_user!
  def new
    @adress = Adress.new
    @end_user = current_end_user
  end

  def create
    @adress = Adress.new(address_params)
    if @adress.save
      redirect_to adresses_path
    else
      @end_user = current_end_user
      render :'public/adresses/new'
    end
  end

  def index
    @adresses = current_end_user.adresses
  end

  def destroy
    adress = Adress.find(params[:id])
    adress.destroy
    redirect_to adresses_path
  end

  private

  def address_params
     params.require(:adress).permit(:name, :address, :post_number, :end_user_id)
  end

end
