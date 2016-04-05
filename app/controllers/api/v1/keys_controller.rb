class Api::V1::KeysController < ::KeysController
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
    super
  end
end
