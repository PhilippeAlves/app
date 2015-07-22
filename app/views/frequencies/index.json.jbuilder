json.array!(@frequencies) do |frequency|
  json.extract! frequency, :id, :date, :user_id
  json.url frequency_url(frequency, format: :json)
end
