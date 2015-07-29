class Room < ActiveRecord::Base
  belongs_to :permission
  belongs_to :floor
  belongs_to :department
  has_many :properties, dependent: :destroy
  has_many :check_points, dependent: :destroy
end
