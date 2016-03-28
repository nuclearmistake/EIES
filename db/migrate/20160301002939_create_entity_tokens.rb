class CreateEntityTokens < ActiveRecord::Migration
  def change
    create_table :entity_tokens do |t|

      t.timestamps null: false
    end
  end
end
