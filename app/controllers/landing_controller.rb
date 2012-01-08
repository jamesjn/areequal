class LandingController < ApplicationController
  def index
    @arts = Art.find(:all, :limit => 5)
  end


end
