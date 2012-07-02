module ProviderMethods
  PROVIDERS.each do |provider|
    define_method("has_#{provider}?") do
      self.authentications.any? { |auth| auth.provider == provider }
    end

    define_method("#{provider}_credential") do
      if self.send("has_#{provider}?")
        auth = self.authentications.find_by_provider(provider)
        auth.credential
      end      
    end
  end
end