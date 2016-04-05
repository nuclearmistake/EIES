class Key < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: [:user] }
  validates_presence_of :user, :body

  has_many :entity_tokens, dependent: :destroy
  belongs_to :user

  def to_public_json
    key = {
      body: body,
      domain: entity_token.entity.domain,
      port: entity_token.entity.port
    }
  end
end
