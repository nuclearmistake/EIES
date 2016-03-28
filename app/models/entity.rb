class Entity < ActiveRecord::Base
  belongs_to :user
  has_many :entity_token
  has_many :key, :through => :entity_token
end
