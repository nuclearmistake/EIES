class EntityTokensController < ApplicationController
  before_action :set_user
  before_action :set_entity_token, only: [:show, :edit, :update, :destroy]

  # GET /entity_tokens
  # GET /entity_tokens.json
  def index
    redirect_to @user
  end

  # GET /entity_tokens/1
  # GET /entity_tokens/1.json
  def show
    redirect_to @user
  end

  # GET /entity_tokens/new
  def new
    @entity = Entity.find(params[:entity_id])
    @entity_token = EntityToken.new
  end

  # GET /entity_tokens/1/edit
  def edit
  end

  # POST /entity_tokens
  # POST /entity_tokens.json
  def create
    p = entity_token_params
    @user = User.find(p[:user_id])
    @entity = Entity.find(p[:entity_id])
    @key = Key.find(p[:key])
    p[:key] = @key
    @entity_token = EntityToken.new(p)

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

  # PATCH/PUT /entity_tokens/1
  # PATCH/PUT /entity_tokens/1.json
  def update
    respond_to do |format|
      if @entity_token.update(entity_token_params)
        format.html { redirect_to @entity_token, flash: { success: 'Entity token was successfully updated.' } }
        format.json { render :show, status: :ok, location: @entity_token }
      else
        format.html { render :edit }
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
    def set_user
      @user = User.find(session[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entity_token
      @entity_token = EntityToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_token_params
      params.require(:entity_token).permit(:entity_id, :user_id, :key)
    end
end
