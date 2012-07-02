class Hash
  def flatten
    new_hash = Hash.new
    self.each do |key, value|
      if value.is_a?(Hash)
        new_hash.merge!(value.flatten)
      else
        new_hash[key] = value
      end
    end
    new_hash
  end
end