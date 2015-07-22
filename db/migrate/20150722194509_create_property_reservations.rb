class CreatePropertyReservations < ActiveRecord::Migration
  def change
    create_table :property_reservations do |t|
      t.boolean :returned
      t.references :property, index: true, foreign_key: true
      t.references :reservation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
