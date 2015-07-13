json.array!(@products) do |product|
  json.extract! product, :id, :img_url, :name, :description
  json.url product_url(product, format: :json)
end
