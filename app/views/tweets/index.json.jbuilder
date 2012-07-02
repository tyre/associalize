json.array!(@tweets) do |json, tweet|
  json.partial! tweet
end