class ApplicationController < ActionController::Base
  include ApplicationHelper

  def check_login
    redirect_to new_session_path if current_user.nil?
  end
end
