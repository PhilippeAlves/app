class UserGroupPermission < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :permission
end
