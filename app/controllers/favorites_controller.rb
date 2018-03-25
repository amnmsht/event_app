class FavoritesController < ApplicationController
    
  def create
    favorite = current_user.favorites.create(event_id: params[:event_id])
    flash[:success] = "#{favorite.event.user.name}さんのイベントをお気に入り登録しました"
    redirect_to events_url
  end

  def destroy
    favorite = current_user.favorites.find_by(event_id: params[:event_id]).destroy
    flash[:warning] = "#{favorite.event.user.name}さんのイベントをお気に入り解除しました"
    redirect_to events_url
  end
end