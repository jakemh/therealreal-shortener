require 'rails_helper'

  Rails.describe Conversions::EncodeInteger, type: :model do

    let(:integer){100}
    let(:encoded_string){"2s"}
    let(:encoder){Conversions::EncodeInteger.new(integer)}

    it 'encodes integer to base 36' do 
      expect(encoder.encode(36)).to eq(encoded_string)
    end


end
