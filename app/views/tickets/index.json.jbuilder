json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :sale_id, :user_id, :paid, :blocked
  json.url ticket_url(ticket, format: :json)
end
