json.array!(@shifts) do |shift|
  json.extract! shift, :id, :name, :description, :begin, :end
  json.url shift_url(shift, format: :json)
end
