class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActionController::InvalidAuthenticityToken do |exception|
    respond_to do |format|
      format.html { redirect_to "sessions#destroy" }
      format.json { render json: { error: "Invalid CSRF token", status: :forbidden } }
    end
  end

  def set_user
    @user = User.find(session[:user_id])
  end

  def verify_session
    if session.id != params[:session_id]
      render json: { error: "Invalid session" }, status: :forbidden
    end
  end
end
