class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthenticationHelper

  before_filter :setup_login_info


  private
    def setup_login_info
      @user = current_user
    end
end
