class UsersController < ApplicationController
  before_action :set_user, :authorize, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    redirect_to :home
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
   @user ||= User.find_by(id: session[:user_id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    logger.info(user_params[:email])

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, flash: { success: 'User was successfully created.' } }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, flash: { success: 'User was successfully updated.' } }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, flash: { success: 'User was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user].permit(:email, :password, :password_confirmation )
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params[:user].permit(:email, :password )
    end

    def authorize
      if @user.id != session[:user_id]
        flash[:danger] = "User operation is forbidden"
        redirect_to "/home"
      end
    end
end
