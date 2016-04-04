class Key < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { scope: [:user] }
  validates_presence_of :user, :body

  belongs_to :entity_token, dependent: :destroy
  belongs_to :user
end
