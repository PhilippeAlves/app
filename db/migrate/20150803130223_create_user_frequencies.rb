class CreateUserFrequencies < ActiveRecord::Migration
  def change
    create_table :user_frequencies do |t|
      t.datetime :date
      t.references :user, index: true, foreign_key: true
      t.string :type_frequency

      t.timestamps null: false
    end
  end
end
