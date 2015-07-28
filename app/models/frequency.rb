class Frequency < ActiveRecord::Base
  belongs_to :user
  has_many :check_points, dependent: :destroy
end
