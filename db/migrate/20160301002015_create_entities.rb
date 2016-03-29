class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :domain
      t.integer :port

      t.timestamps null: false
    end
  end
end
