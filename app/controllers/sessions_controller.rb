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
      @current_user = user
      redirect_to images_path
    else
      render :new
    end
  end

  def show
    @session = Session.new
    render :new
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
