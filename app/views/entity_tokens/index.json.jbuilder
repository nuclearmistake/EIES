json.array!(@entity_tokens) do |entity_token|
  json.extract! entity_token, :id
  json.url entity_token_url(entity_token, format: :json)
end
