json.array!(@people) do |person|
  json.extract! person, :id, :name, :user_id, :group_id, :balance
  json.url person_url(person, format: :json)
end
