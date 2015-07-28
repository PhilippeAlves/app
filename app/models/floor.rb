class Floor < ActiveRecord::Base
  belongs_to :department
  has_many :rooms, dependent: :destroy
end
