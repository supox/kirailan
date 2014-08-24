json.array!(@transports) do |transport|
  json.extract! transport, :id, :name, :direction, :comments, :phone
  json.url transport_url(transport, format: :json)
end
