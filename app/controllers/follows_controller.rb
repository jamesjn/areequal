class FollowsController < ApplicationController
  def create
    user_to_follow = params[:follow_id]
    if Relationship.create(:follower_id=> current_user.id, :followed_id => user_to_follow)
      render :json => {:following => true}
    else
      render :json => {:following => false}
    end
  end

  def unsubscribe
    user_to_unsubscribe_from = params[:user_id]
    relationship = Relationship.where(:follower_id => current_user.id, :followed_id => user_to_unsubscribe_from)
    if relationship.destroy_all
      render :json => {:unsubscribed => true}
    else
      render :json => {:unsubscribed => false}
    end
  end
end
