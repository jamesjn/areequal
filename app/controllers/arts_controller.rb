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
    case params[:sort]
    when "Most Recent"
      sort = "created_at"
    when "Most Liked"
      sort = "liked_count"
    when "Most Favorited"
      sort = "favorited_count"
    when "Most Viewed"
      sort = "views_count"
    end

    case params[:time_range]
    when "All Time"
      time_range = 5.years.ago
    when "Today"
      time_range = 1.day.ago
    when "This week"
      time_range = 1.week.ago
    when "This month"
      time_range = 1.month.ago
    end
    if params[:category] == 'All'
      @arts = Art.where("created_at >= ?", time_range).order(sort)
    else
      @arts = Art.where(:category => params[:category]).before(time_range).order(sort)
    end
    render :partial => "shared/art_listing", :collection => @arts
  end
  
  helper_method :youtube_embed
end
