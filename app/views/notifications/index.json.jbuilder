json.array!(@notifications) do |notification|
  json.extract! notification, :id, :suggestion_id, :user_id, :seen
  json.url notification_url(notification, format: :json)
end
