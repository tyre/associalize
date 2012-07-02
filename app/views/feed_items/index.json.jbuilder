json.array!(@feed_items) do |json, feed_item|
  json.partial! feed_item
end