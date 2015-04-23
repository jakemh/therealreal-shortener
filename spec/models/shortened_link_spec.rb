require 'rails_helper'

RSpec.describe ShortenedLink, type: :model do

  let(:test_uri){"www.test.com"}
  let(:shortened_link){ ShortenedLink.build_from_uri(test_uri)}
  let(:test_seed){9999999}

  describe '#build_from_uri' do

    before(:each) do
      allow(ShortenedLink).to receive_messages(:encode_seed => test_seed)
      shortened_link.save!
      
    end

    it 'creates a new object with uri' do
      expect(ShortenedLink.where('url LIKE ?', "%#{test_uri}%")).not_to be_empty
    end

    it 'contains valid encode string for base' do
      expect(shortened_link.encoded_string).to eq "9h5jv"
    end

    it 'contains valid url' do
      expect(shortened_link.url).to include(test_uri)
      expect(shortened_link.url.match(/^https?:\/\//).to_a).not_to be_empty
    end

  end

end
