class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
