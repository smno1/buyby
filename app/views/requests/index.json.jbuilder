json.array!(@requests) do |request|
  json.extract! request, :id, :subject, :description, :user_id
  json.url request_url(request, format: :json)
end
