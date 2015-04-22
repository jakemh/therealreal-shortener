module Utilities
  module Http
      
    # check to see if uri is a url
    def self.url?(uri)
      u = URI.parse(uri)
      if(!u.scheme)
          false
      elsif(Set.new(%w{http https}).include?(u.scheme))
         true
      else
        # i guess we'll support all protocols for now
        true
      end
    end
  end
end