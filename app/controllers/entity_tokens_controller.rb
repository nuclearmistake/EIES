class EntityTokensController < ApplicationController
  before_action :set_user
  before_action :set_entity_token, :authorize, only: [:show, :edit, :update, :destroy]

  # GET /entity_tokens
  # GET /entity_tokens.json
  def index
    redirect_to @user
  end

  # GET /entity_tokens/1
  # GET /entity_tokens/1.json
  def show
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { render json: @entity_token, status: :ok }
    end
  end

  # GET /entity_tokens/new
  def new
    @entity_token = EntityToken.new
    @entity_token.entity = Entity.find(params[:entity_id])
  end

  # GET /entity_tokens/1/edit
  def edit
  end

  # POST /entity_tokens
  # POST /entity_tokens.json
  def create
    @entity_token = EntityToken.new(entity_token_params)
    @entity_token.user = @user

    respond_to do |format|
      if @entity_token.save
        format.html { redirect_to @entity_token, flash: { success: 'Entity token was successfully created.' } }
        format.json { render :show, status: :created, location: @entity_token }
      else
        format.html { render :new }
        format.json { render json: @entity_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entity_tokens/1
  # DELETE /entity_tokens/1.json
  def destroy
    @entity_token.destroy
    respond_to do |format|
      format.html { redirect_to entity_tokens_url, flash: { success: 'Entity token was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_token
      @entity_token = EntityToken.find(params[:id])
      @entity = @entity_token.entity
      @key = @entity_token.key
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_token_params
      params.require(:entity_token).permit(:entity_id, :key_id)
    end

    def authorize
      unless session[:user_id] == @entity_token.user.id
        error = "User does not own this entity_token"
        flash[:danger] = error
        respond_to do |format|
          format.html { redirect_to :back }
          format.json { render json: { error: error }, status: :forbidden }
        end
      end
    end
end
