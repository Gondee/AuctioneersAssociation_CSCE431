json.array!(@continueedus) do |continueedu|
  json.extract! continueedu, :id, :Annual_Convention_CE_Hours, :Online_CE_Hours, :member_id
  json.url continueedu_url(continueedu, format: :json)
end
