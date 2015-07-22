class CheckPoint < ActiveRecord::Base
  belongs_to :frequency
  belongs_to :room
end
