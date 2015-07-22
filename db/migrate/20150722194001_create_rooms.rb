class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.references :permission, index: true, foreign_key: true
      t.references :floor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
