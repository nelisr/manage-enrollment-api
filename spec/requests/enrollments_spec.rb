require 'rails_helper'

RSpec.describe "Enrollments", type: :request do
  let(:url) { "/students" } 

  let(:params) do
    {
      student: {
        name: "Usuário Teste", 
        cpf: "151.686.860-95", 
        birthdate: "17/02/1994", 
        payment_method: "boleto"
      }      
    }
  end

  describe "#index GET /enrollments" do
    it "returns http success" do
      get url
      expect(response).to have_http_status(:success)
    end
  end # index
    
  before do
    http_login
  end

  describe "#create POST /enrollments" do
    it "returns http success" do
      post url, params: params
      expect(response).to have_http_status(:created)
    end
  end # create
end
