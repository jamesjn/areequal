class ArtsController < ApplicationController
  include ArtsHelper
  

  def new
    if user_signed_in?
      @art = Art.new
    else
      render :action => 'log_in_option'
    end
  end


  def create
    if !user_signed_in?
      render :text => "Please log in"  
    else
      art_params = params[:art]
      art_params["user_id"] = current_user.id
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
    @arts_found = Art.search @search_term
  end

  def edit
    @art = Art.find(params[:id])
    if @art.user_id != current_user.id
      flash[:error] = "You are not the owner of the art"
      redirect_to @art  
    else
      render
    end 
  end

  def index
    if params[:category] == 'All'
      @arts = Art.all
    else
      @arts = Art.where(:category => params[:category])
    end
    render :partial => "shared/art_listing", :collection => @arts
  end
  
  helper_method :youtube_embed
end
