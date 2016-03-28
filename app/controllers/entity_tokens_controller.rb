class EntityTokensController < ApplicationController
  before_action :set_entity_token, only: [:show, :edit, :update, :destroy]

  # GET /entity_tokens
  # GET /entity_tokens.json
  def index
    @entity_tokens = EntityToken.all
  end

  # GET /entity_tokens/1
  # GET /entity_tokens/1.json
  def show
  end

  # GET /entity_tokens/new
  def new
    @entity_token = EntityToken.new
  end

  # GET /entity_tokens/1/edit
  def edit
  end

  # POST /entity_tokens
  # POST /entity_tokens.json
  def create
    @entity_token = EntityToken.new(entity_token_params)

    respond_to do |format|
      if @entity_token.save
        format.html { redirect_to @entity_token, notice: 'Entity token was successfully created.' }
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
        format.html { redirect_to @entity_token, notice: 'Entity token was successfully updated.' }
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
      format.html { redirect_to entity_tokens_url, notice: 'Entity token was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity_token
      @entity_token = EntityToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_token_params
      params.fetch(:entity_token, {})
    end
end
