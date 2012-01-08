class ArtsController < ApplicationController
  include ArtsHelper

  def new
    if session[:user_id].nil?
      render :action => 'log_in_option'
    else
      @art = Art.new
    end
  end


  def create
    if session[:user_id].nil?
      render :text => "Please log in"  
    else
      art_params = params[:art]
      art_params["user_id"] = session[:user_id]
      @art = Art.new(art_params)
      if @art.save
        redirect_to(@art)
      else
        render :action => 'new'
      end
    end
  end

  def show
    @art = Art.find(params[:id])
    @owner = User.find(@art.user_id)
  end

  def search
    @search_term = params[:query]
  end
  
  helper_method :youtube_embed
end
