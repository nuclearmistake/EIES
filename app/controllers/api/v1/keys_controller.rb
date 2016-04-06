class Api::V1::KeysController < ::KeysController
  skip_before_action :verify_authenticity_token
  before_action :verify_session, except: :get

  def create
    super
  end

  def show
    super
  end

  def get
    if params[:domain] && params[:port]
      q = EntityToken.joins(:entity)
              .joins(:key)
              .where(entities: { domain: params[:domain], port: params[:port] })
              .as_json(only: [:key, :entity],
                       include: [{ key: { only: :body } },
                                 { entity: { only: [:domain, :port]}}])
      if q.length > 0
        render json: q
        return
      end
    end

    if params[:domain]
      q = EntityToken.joins(:entity)
              .joins(:key)
              .where(entities: { domain: params[:domain] })
              .as_json(only: [:key, :entity],
                       include: [{ key: { only: :body } },
                                 { entity: { only: [:domain, :port]}}])
      if q.length > 0
        render json: q
        return
      end
    end

    render json: {}, status: :not_found
  end

  def update
    super
  end

  def destroy
    super
  end
end
