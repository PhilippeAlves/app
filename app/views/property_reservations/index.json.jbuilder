json.array!(@property_reservations) do |property_reservation|
  json.extract! property_reservation, :id, :returned, :property_id, :reservation_id
  json.url property_reservation_url(property_reservation, format: :json)
end
