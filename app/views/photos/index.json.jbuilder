json.array!(@photos) do |photo|
  json.extract! photo, :id, :suggestion_id, :filename
  json.url photo_url(photo, format: :json)
end
