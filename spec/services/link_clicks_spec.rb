require 'rails_helper'

Rails.describe LinkClicks, type: :service do

  let(:click){ FactoryGirl.create(:click) }
  let(:shortened_link){ click.shortened_link }

  describe '#click_count' do 
    it 'counts the number of clicks for a given shortened link' do 
      start_count = LinkClicks.new(shortened_link).click_count
      shortened_link.clicks.create
      shortened_link.reload
      end_count = shortened_link.clicks.count
      expect(end_count).to eq(start_count + 1)
    end
  end
end

