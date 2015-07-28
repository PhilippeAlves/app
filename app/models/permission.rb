class Permission < ActiveRecord::Base
  has_many :rooms, dependent: :destroy
  has_many :user_group_permissions, dependent: :destroy
end
