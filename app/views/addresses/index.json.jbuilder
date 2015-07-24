json.array!(@addresses) do |address|
  json.extract! address, :id, :postcode, :state, :city, :street, :user_id
  json.url address_url(address, format: :json)
end
