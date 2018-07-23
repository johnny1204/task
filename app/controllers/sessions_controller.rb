class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new(email: params[:session][:email], password: params[:session][:password])
    return render :new unless @session.valid?
    user = @session.user
    if user
      session[:user_id] = user.email
    else
      render :new
    end
  end

  def show
    render :new
  end
end
