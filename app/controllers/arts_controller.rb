class ArtsController < ApplicationController
  include ArtsHelper, AuthenticationHelper
  before_filter :ensure_signed_in

  def new
    @art = Art.new
  end

  def create
    art_params = params[:art]
    art_params["user_id"] = session[:user_id]
    @art = Art.new(art_params)
    if @art.save
      redirect_to(@art)
    else
      render :action => 'new'
    end
  end

  def show
    @art = Art.find(params[:id])
    @owner = User.find(@art.user_id)
  end
  
  helper_method :youtube_embed
end
