class SessionsController < ApplicationController
  def new
  end

  def create
    if session && session[:user_id]
      @user ||= User.find(session[:user_id])
      redirect_to @user
      return
    end

    if params[:email].nil? || params[:password].nil?
      render 'new'
      return
    end

    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    @user = nil
    session[:user_id] = nil

    redirect_to "/home"
  end

end
