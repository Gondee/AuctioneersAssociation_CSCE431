json.array!(@pacs) do |pac|
  json.extract! pac, :id, :PAC_Contribution, :member_id
  json.url pac_url(pac, format: :json)
end
