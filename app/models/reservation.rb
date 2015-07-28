class Reservation < ActiveRecord::Base
  belongs_to :user
  has_many :property_reservations, dependent: :destroy
end
