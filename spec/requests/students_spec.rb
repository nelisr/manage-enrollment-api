require 'rails_helper'

RSpec.describe "Students", type: :request do
  let(:url) { "/students" }    

  describe "#index GET /students" do
    it "returns http success" do
      get url
      expect(response).to have_http_status(:success)
    end
  end # index

  describe "#create POST /students" do        
    it "returns http success" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end # create
end
