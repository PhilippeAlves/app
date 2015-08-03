json.array!(@user_frequencies) do |user_frequency|
  json.extract! user_frequency, :id, :date, :user_id, :type
  json.url user_frequency_url(user_frequency, format: :json)
end
