class PropertyReservation < ActiveRecord::Base
  belongs_to :property
  belongs_to :reservation
end
