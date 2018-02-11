class UsersController < ApplicationController
    
    def show
      @user = User.find(params[:id])
      @favorites_events = @user.favorites
 end
end
