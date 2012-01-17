class FavoritesController < ApplicationController
  def create
   art_to_favorite = params[:art_id]
    if Favorite.create(:user_id => current_user.id, :art_id => art_to_favorite)
      render :json => {:favorited => true}
    else
      render :json => {:favorited => false}
    end
  end
end
