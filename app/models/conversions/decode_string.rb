module Conversions
  class DecodeString
    attr_accessor :string

    def initialize(string)
      self.string = string
    end

    def decode(base)
      self.string.to_i(base)
    end

  end
end