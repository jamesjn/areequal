class ArtsController < ApplicationController
  before_filter :ensure_signed_in

  def new
    @art = Art.new
  end

  def create
    art_params = params[:art]
    art_params["user_id"] = session[:user_id]
    Art.create(art_params)
    render :text => "complete"
  end

  def show
    @art = Art.find(params[:id])
    @owner = User.find(@art.user_id)
  end
end
