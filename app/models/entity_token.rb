class EntityToken < ActiveRecord::Base
  belongs_to :user
  has_one :entity
  has_one :key
end
