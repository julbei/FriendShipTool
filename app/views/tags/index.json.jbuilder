json.array!(@tags) do |tag|
  json.extract! tag, :id, :name, :group_id
  json.url tag_url(tag, format: :json)
end
