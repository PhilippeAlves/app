class CreateCheckPoints < ActiveRecord::Migration
  def change
    create_table :check_points do |t|
      t.date :hour
      t.references :frequency, index: true, foreign_key: true
      t.references :room, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
