class Entity < ActiveRecord::Base
  validates :domain, presence: true, uniqueness: { case_sensitive: false, scope: [ :port ] }

  belongs_to :user
  has_one :entity_token, dependent: :destroy
  has_many :key, :through => :entity_token
end
