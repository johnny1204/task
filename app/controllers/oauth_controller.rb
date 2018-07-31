require 'net/http'
require 'uri'
class OauthController < ApplicationController
  def callback
    if request.params.key?(:code)
      uri = URI.parse('https://arcane-ravine-29792.herokuapp.com/oauth/token')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data({
        code: request.params[:code], grant_type: :authorization_code,
        redirect_uri: Rails.application.routes.url_helpers.oauth_callback_url,
        client_id: ENV['OAUTH_CLIENT_ID'], client_secret: ENV['OAUTH_CLIENT_SECRET']
      })
      response = http.request(request)
      json = JSON.parse(response.body)
      session[:access_token] = json['access_token'] if json.key?('access_token')
    end
    redirect_to images_path
  end
end
