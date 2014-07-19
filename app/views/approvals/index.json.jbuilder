json.array!(@approvals) do |approval|
  json.extract! approval, :id, :name, :guests, :comments
  json.url approval_url(approval, format: :json)
end
