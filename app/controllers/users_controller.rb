class UsersController < ApplicationController
  def edit_profile
    current_user_id = session[:user_id]
    redirect_to edit_user_path(current_user_id) 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user_params = params[:user]
    user_params["id"] = session[:user_id]
    current_user_id = session[:user_id]
    User.update(current_user_id, user_params)
    flash[:saved] = true
    redirect_to edit_user_path(current_user_id) 
  end
end
