class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:email].nil? || params[:password].nil?
      flash[:danger] = 'Cannot create session.' # Not quite right!
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
  end

end
