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
    @user = current_user
    render
  end

  def update
    user_params = params[:user]
    user_params["id"] = current_user.id
    User.update(current_user.id, user_params)
    flash[:saved] = true
    redirect_to edit_user_path(current_user.id) 
  end

  def show_art
    @current_user = current_user
    @users_art = Art.where(:user_id => current_user.id)
  end

  def user_page
    @user = current_user
  end

  def myart
    @user = current_user
    @users_art = Art.where(:user_id => current_user.id)
    render :myart, :layout => false
  end

  def settings
    @user = current_user
    render :edit, :layout => false
  end

  def messages
    render :messages, :layout => false
  end

  def subscriptions
    render :subscriptions, :layout => false
  end

  def favorites
    @users_art = current_user.favorite_arts
    render :favorites, :layout => false
  end

end
