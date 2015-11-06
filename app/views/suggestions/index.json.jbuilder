json.array!(@suggestions) do |suggestion|
  json.extract! suggestion, :id, :user_id, :category_id, :name, :description, :liked, :location
  json.url suggestion_url(suggestion, format: :json)
end
