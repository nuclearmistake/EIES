class KeysController < ApplicationController
  before_action :set_user
  before_action :set_key, :authorize, only: [:show, :edit, :update, :destroy]

  # GET /keys
  # GET /keys.json
  def index
    redirect_to @user
  end

  # GET /keys/1
  # GET /keys/1.json
  def show
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { render json: @key }
    end
  end

  # GET /keys/new
  def new
    @key = Key.new
  end

  # GET /keys/1/edit
  def edit
  end

  # POST /keys
  # POST /keys.json
  def create
    @key = Key.new(key_params)
    @key.user = @user

    respond_to do |format|
      if @key.save
        format.html { redirect_to @key, flash: { success: 'Key was successfully created.' } }
        format.json { render :show, status: :created, location: @key }
      else
        format.html { render :new }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /keys/1
  # PATCH/PUT /keys/1.json
  def update
    respond_to do |format|
      if @key.update(key_params)
        format.html { redirect_to @key, flash: { success: 'Key was successfully updated.' } }
        format.json { render :show, status: :ok, location: @key }
      else
        format.html { render :edit }
        format.json { render json: @key.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.json
  def destroy
    @key.destroy
    respond_to do |format|
      format.html { redirect_to keys_url, flash: { success: 'Key was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_key
      @key = Key.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def key_params
      params.require(:key).permit(:name, :body)
    end

    def authorize
      unless session[:user_id] == @key.user.id
        error = "User does not own this key"
        flash[:danger] = error
        respond_to do |format|
          format.html { redirect_to :back }
          format.json { render json: { error: error }, status: :forbidden }
        end
      end
    end
end
