class EntityToken < ActiveRecord::Base
  validates :key, presence: true
  validates :user, presence: true
  validates :entity, presence: true

  belongs_to :user
  belongs_to :entity
  has_one :key
end
