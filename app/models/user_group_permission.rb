class UserGroupPermission < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :permission

  validates :user_group_id, presence: true
  validates :permission_id, presence: true
end
