class User < ActiveRecord::Base
  belongs_to :user_group
  belongs_to :shift
end
