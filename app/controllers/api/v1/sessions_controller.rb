class Api::V1::SessionsController < ::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    super
  end

  def destroy
    super
  end
end
