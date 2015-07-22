class CreateFrequencies < ActiveRecord::Migration
  def change
    create_table :frequencies do |t|
      t.date :date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
