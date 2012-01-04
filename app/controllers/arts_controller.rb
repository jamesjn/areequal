class ArtsController < ApplicationController
  include ArtsHelper
  before_filter :ensure_signed_in

  def new
    @art = Art.new
  end

  def create
    art_params = params[:art]
    art_params["user_id"] = session[:user_id]
    @art = Art.create(art_params)
    redirect_to(@art)
  end

  def show
    @art = Art.find(params[:id])
    @owner = User.find(@art.user_id)
  end
  
  helper_method :youtube_embed
end
