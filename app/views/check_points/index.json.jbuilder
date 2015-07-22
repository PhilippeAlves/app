json.array!(@check_points) do |check_point|
  json.extract! check_point, :id, :hour, :frequency_id, :room_id
  json.url check_point_url(check_point, format: :json)
end
