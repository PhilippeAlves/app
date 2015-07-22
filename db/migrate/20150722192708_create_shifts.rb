class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :name
      t.text :description
      t.date :begin
      t.date :end

      t.timestamps null: false
    end
  end
end
