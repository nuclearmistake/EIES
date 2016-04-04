class CreateEntityTokens < ActiveRecord::Migration
  def change
    create_table :entity_tokens do |t|
      t.belongs_to :user, index: true
      t.belongs_to :entity, index: true

      t.timestamps null: false
    end
  end
end
