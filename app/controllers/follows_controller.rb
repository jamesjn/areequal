class FollowsController < ApplicationController
  def create
    user_to_follow = params[:follow_id]
    if Followings.create(:user_id => current_user.id, :follower_id => user_to_follow)
      render :json => {:following => true}
    else
      render :json => {:following => false}
    end
  end
end
