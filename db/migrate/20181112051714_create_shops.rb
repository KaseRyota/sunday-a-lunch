class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :contributer
      t.string :photo
      t.string :name
      t.text :comment
      t.integer :junapoint

      t.timestamps null: false
    end
  end
end
