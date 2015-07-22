json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :card, :birthday, :cpf, :rg, :user_group_id, :shift_id
  json.url user_url(user, format: :json)
end
