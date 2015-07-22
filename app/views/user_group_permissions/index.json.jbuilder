json.array!(@user_group_permissions) do |user_group_permission|
  json.extract! user_group_permission, :id, :user_group_id, :permission_id
  json.url user_group_permission_url(user_group_permission, format: :json)
end
