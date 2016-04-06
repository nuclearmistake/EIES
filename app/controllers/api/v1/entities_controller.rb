class Api::V1::EntitiesController < ::EntitiesController
  skip_before_action :verify_authenticity_token
  before_action :verify_session

  def create
    super
  end

  def show
    super
  end

  def update
    super
  end

  def destroy
b    super
  end
end
