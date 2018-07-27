class OauthController < ApplicationController
  def callback
    redirect_to images_path
  end
end
