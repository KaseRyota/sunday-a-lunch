class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :mentor
      t.string :name
      t.text :comment

      t.timestamps null: false
    end
  end
end
