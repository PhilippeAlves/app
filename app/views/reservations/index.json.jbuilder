json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :date, :user_id
  json.url reservation_url(reservation, format: :json)
end
