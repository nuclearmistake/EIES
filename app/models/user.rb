class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /.*\@.*\..*/ }
  has_secure_password
  has_many :entities, dependent: :destroy
  has_many :entity_tokens, dependent: :destroy
  has_many :keys, dependent: :destroy
end
