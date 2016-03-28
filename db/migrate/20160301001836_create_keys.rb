class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
