class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /.*\@.*\..*/ }
  has_secure_password
  has_many :entities
  has_many :entity_tokens
  has_many :keys
end
