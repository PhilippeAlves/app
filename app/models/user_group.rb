class UserGroup < ActiveRecord::Base
  has_many :users
  has_many :user_group_permissions, dependent: :destroy
end
