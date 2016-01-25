json.array!(@trains) do |train|
  json.extract! train, :id, :train_number
  json.url train_url(train, format: :json)
end
