json.array!(@hitchhikes) do |hitchhike|
  json.extract! hitchhike, :id, :name, :phone, :from, :hour, :comments, :taking
  json.url hitchhike_url(hitchhike, format: :json)
end
