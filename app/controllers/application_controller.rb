class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # deviceのコントローラーのときに、下記のメソッドを呼ぶ
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      # sign_upのときに、usernameも許可する
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      #  account_updateのときに、usernameも許可する
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end