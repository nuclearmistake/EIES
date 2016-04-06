class Api::V1::UsersController < ::UsersController
  skip_before_action :verify_authenticity_token
  before_action :verify_session

  def show
    super
  end
end
