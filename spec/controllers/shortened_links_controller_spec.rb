require 'rails_helper'
RSpec.describe ShortenedLinksController, type: :controller do
  render_views

  let(:shortened_link){ FactoryGirl.create(:shortened_link) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    it "adds a new shortened_link" do
      start_count = ShortenedLink.all.count
      post :create, shortened_link: {url: "www.test.com"}
      end_count = ShortenedLink.all.count
      expect(end_count).to eq(start_count + 1)
    end
  end

end
