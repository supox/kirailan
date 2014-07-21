json.array!(@wishes) do |wish|
  json.extract! wish, :id, :content, :name
  json.url wish_url(wish, format: :json)
end
