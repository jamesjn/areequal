class ArtsController < ApplicationController
  before_filter :ensure_signed_in

  def new
    @art = Art.new
  end

  def create
    Art.create(params[:art])
    render :text => "complete"
  end

end
