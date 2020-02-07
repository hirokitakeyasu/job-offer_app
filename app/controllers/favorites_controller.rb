class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end
  
  def create
    favorite = current_user.favorites.build(offer_id: params[:offer_id])
    favorite.save
    redirect_to offers_path
  end

  def destroy
    favorite = Favorite.find_by(offer_id: params[:offer_id], user_id: current_user.id)
    favorite.destroy
    redirect_to offers_path
  end
end
