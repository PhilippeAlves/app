class Property < ActiveRecord::Base
  belongs_to :room
  has_many :property_reservations, dependent: :destroy
end
