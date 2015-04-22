module Conversions
  class EncodeInteger
    
    attr_accessor :integer

    def initialize(integer)
      self.integer = integer
    end

    def encode(base)
      self.integer.to_s(base)
    end

  end
end