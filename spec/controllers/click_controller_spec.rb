require 'rails_helper'

RSpec.describe ClickController, type: :controller do

  let(:click){ FactoryGirl.create(:click) }
  let(:shortened_link){ click.shortened_link }

  describe "POST create" do
    it "adds a click to a shortened link" do
      start_count = shortened_link.clicks.count
      post :create, {shortened_link_id: shortened_link.id}
      shortened_link.reload
      end_count = shortened_link.clicks.count
      expect(end_count).to eq(start_count + 1)
    end
  end

end
