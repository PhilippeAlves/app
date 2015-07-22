class CreateUserGroupPermissions < ActiveRecord::Migration
  def change
    create_table :user_group_permissions do |t|
      t.references :user_group, index: true, foreign_key: true
      t.references :permission, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
