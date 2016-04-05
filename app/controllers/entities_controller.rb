class EntitiesController < ApplicationController
  before_action :set_user
  before_action :set_entity, :authorize, only: [:show, :edit, :update, :destroy]

  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
    respond_to do |format|
      format.html { redirect_to @user }
      format.json { @user}
    end
  end

  # GET /entities/new
  def new
    @entity = Entity.new
  end

  # GET /entities/1/edit
  def edit
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = @user.entities.new(entity_params)

    respond_to do |format|
      if @entity.save
        format.html { redirect_to @entity, flash: { success: 'Entity was successfully created.' } }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    respond_to do |format|
      if @entity.update(entity_params)
        format.html { redirect_to @entity, flash: { success: 'Entity was successfully updated.' } }
        format.json { render :show, status: :ok, location: @entity }
      else
        format.html { render :edit }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity.destroy
    respond_to do |format|
      format.html { redirect_to :back, flash: { success: 'Entity was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entity
      @entity = Entity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entity_params
      params.require(:entity).permit(:name, :domain, :port)
    end

    def authorize
      unless session[:user_id] == @entity.user.id
        error = "User does not own this entity"
        flash[:danger] = error
        respond_to do |format|
          format.html { redirect_to :back }
          format.json { render json: { error: error }, status: :forbidden }
        end
      end
    end
end
