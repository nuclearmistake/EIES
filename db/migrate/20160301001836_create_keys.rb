class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :name
      t.string :body
      t.belongs_to :user, index: true
      t.belongs_to :entity_token, index: true

      t.timestamps null: false
    end
  end
end
