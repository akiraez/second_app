class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user
    @end_user.update(end_user_params)
    redirect_to end_user_path(@end_user)
  end

  def confirmation
    @end_user = current_end_user
  end

  def withdrawal
    @end_user = current_end_user
    @end_user.update(is_active_member_status: false)
    redirect_to root_path
  end

  private

  def end_user_params
    params.require(:end_user).permit(:first_name, :under_name,:kana_first_name, :kana_under_name,
      :email, :post_number, :address, :phone_number, :is_active_member_status)
    end
  end
