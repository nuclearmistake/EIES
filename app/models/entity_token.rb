class EntityTokenValidator < ActiveModel::Validator
  def validate(record)
    return unless record.errors.blank?

    valid = true
    if record.entity.user.id != record.user.id
      valid = false
      record.errors[:entity] << "User doesn't own this entity"
    end

    if record.key.user.id != record.user.id
      valid = false
      record.errors[:key] << "User doesn't own this key"
    end

    return valid
  end
end

class EntityToken < ActiveRecord::Base
  validates :key, presence: true
  validates :user, presence: true
  validates :entity, presence: true, uniqueness: { scope: :user }

  belongs_to :user
  belongs_to :entity
  belongs_to :key

  include ActiveModel::Validations
  validates_with EntityTokenValidator
end
