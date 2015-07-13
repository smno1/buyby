json.array!(@recommend_products) do |recommend_product|
  json.extract! recommend_product, :id, :product_id, :active, :reason
  json.url recommend_product_url(recommend_product, format: :json)
end
