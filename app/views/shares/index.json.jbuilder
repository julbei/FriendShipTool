json.array!(@shares) do |share|
  json.extract! share, :id, :accounting_id, :lender_id, :borrower_id, :amount
  json.url share_url(share, format: :json)
end
