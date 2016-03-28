class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /.*\@.*\..*/ }
  has_secure_password
  has_many :entity
  has_many :entity_token
end
