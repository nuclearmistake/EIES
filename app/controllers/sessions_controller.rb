class SessionsController < ApplicationController
  protect_from_forgery except: :create

  def new
  end

  def create
    if session && session[:user_id] && session[:user_token]
      @user ||= User.find(session[:user_id])
      respond_to do |format|
        format.html { redirect_to @user }
        format.json { render json: session, status: :ok }
      end
      return
    end

    if params[:email].nil? || params[:password].nil?
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: { error: "Must specify an email and a password." }, status: :forbidden }
      end
      return
    end

    @user = User.find_by(email: params[:email].downcase)
    if @user && @user.authenticate(params[:password])
      # Log the user in and redirect to the user's show page.
      session[:user_id] = @user.id
      session[:state]  = SecureRandom.hex
      respond_to do |format|
        format.html { redirect_to @user }
        format.json { render json: session, status: :ok }
      end
      return
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      respond_to do |format|
        format.html { render 'new' }
        format.json { render json: {}, status: :unauthorized }
      end
      return
    end
  end

  def destroy
    @user = nil
    session[:user_id] = nil
    session[:state] = nil
    redirect_to "/home"
  end

end
