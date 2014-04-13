json.array!(@accountings) do |accounting|
  json.extract! accounting, :id, :group_id, :person_id, :amount
  json.url accounting_url(accounting, format: :json)
end
