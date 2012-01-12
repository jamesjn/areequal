class UsersController < ApplicationController
  include UsersHelper

  def login
    signed_request = params["signed_request"]
    secret_id = '4c5b5434fa5baae93460ca54eee86374'
    facebook_data = decode_data(secret_id, signed_request)
    user = User.find_or_create_by_id(facebook_data["user_id"])
    session[:user_id] = user.id
    render :json => {:verified => true}
  end
  
  def logout
    session[:user_id] = nil
    render :json => {:logout => true}
  end

  def edit_profile
    current_user_id = session[:user_id]
    redirect_to edit_user_path(current_user_id) 
  end

  def edit
    @user = User.find(params[:id])
    if @user.id = session[:user_id]
      render
    else
      flash[:error] = "Incorrect User"
      redirect_to root_url
    end
  end

  def update
    user_params = params[:user]
    user_params["id"] = session[:user_id]
    current_user_id = session[:user_id]
    User.update(current_user_id, user_params)
    flash[:saved] = true
    redirect_to edit_user_path(current_user_id) 
  end

  def show_art
    @current_user = User.find(session[:user_id])
    @users_art = Art.where(:user_id => current_user.id)
  end
end
