class Room < ActiveRecord::Base
  belongs_to :permission
  belongs_to :floor
end
