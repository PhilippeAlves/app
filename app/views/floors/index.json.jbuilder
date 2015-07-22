json.array!(@floors) do |floor|
  json.extract! floor, :id, :name, :description, :department_id
  json.url floor_url(floor, format: :json)
end
