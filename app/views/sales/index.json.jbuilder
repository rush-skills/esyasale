json.array!(@sales) do |sale|
  json.extract! sale, :id, :start, :end, :quantity, :user_id
  json.url sale_url(sale, format: :json)
end
