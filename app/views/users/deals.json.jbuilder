json.array!(@deals) do |json, deal|
  json.partial! deal
end