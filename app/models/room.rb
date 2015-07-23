class Room < ActiveRecord::Base
  belongs_to :permission
  belongs_to :floor
  has_many :properties, dependent: :destroy
  has_many :check_points, dependent: :destroy
end
