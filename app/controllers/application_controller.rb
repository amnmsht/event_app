class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  PERMISSIBLE_ATTRIBUTES = %i(name avatar avatar_cache)

  protected
      #sign_upのときに、username,avatar_cacheも許可する
      #account_updateのときに、username,avatar_cacheも許可する
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
      devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
    end
  end