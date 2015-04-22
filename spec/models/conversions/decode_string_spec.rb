require 'rails_helper'

  Rails.describe Conversions::DecodeString, type: :model do

    let(:integer){100}
    let(:encoded_string){"2s"}
    let(:decoder){Conversions::DecodeString.new(encoded_string)}

    it 'decode string to base 10' do 
      expect(decoder.decode(36)).to eq(integer)
    end


end
