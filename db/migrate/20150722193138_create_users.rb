class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :card
      t.date :birthday
      t.string :cpf
      t.string :rg
      t.references :user_group, index: true, foreign_key: true
      t.references :shift, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
