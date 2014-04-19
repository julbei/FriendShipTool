json.array!(@taggings) do |tagging|
  json.extract! tagging, :id, :tag_id, :accounting_id
  json.url tagging_url(tagging, format: :json)
end
