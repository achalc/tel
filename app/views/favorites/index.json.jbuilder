json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :user_id, :suggestion_id, :liked
  json.url favorite_url(favorite, format: :json)
end
