class CreateEntityTokens < ActiveRecord::Migration
  def change
    create_table :entity_tokens do |t|
      t.string :key

      t.timestamps null: false
    end
  end
end
