json.array!(@payments) do |payment|
  json.extract! payment, :id, :Pymt_Type, :Pymt_Amt, :Pymt_Date, :member_id
  json.url payment_url(payment, format: :json)
end
