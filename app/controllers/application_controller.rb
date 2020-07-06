class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource

    when EndUser
    end_user_path(resource)

    when Admin
    admin_top_path(resource)
  end
end


  def after_sign_out_path_for(resource_or_scope)
     if resource_or_scope == :admin
       new_admin_session_path
     else
       root_path
     end
   end



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :first_name, :under_name,
      :kana_first_name, :kana_under_name, :post_number, :address])
  end
end