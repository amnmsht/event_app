class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  protected

    def configure_permitted_parameters
      # sign_upのときに、username,avatar_cacheも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      #  account_updateのときに、username,avatar_cacheも許可する
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end
  end