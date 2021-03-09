class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:id])
    current_user.favorite(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Micropost.find(params[:id])
    current_user.unfavorite(micropost)
    flash[:success] = 'お気に入りを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
end