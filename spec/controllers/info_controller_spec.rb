require 'rails_helper'

RSpec.describe InfoController, type: :controller do

  describe "info#new action" do
    it "should successfully show the new form" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "info#create action" do
    it "should successfully create new info in our database" do
      post :create, params: { info: { message: 'First gen'} }
      expect(response).to redirect_to root_path

      info = Info.last
      expect(info.message).to eq("First gen")
    end

    it "should properly deal with validation errors" do
      post :create, params: { info: { message: ''} }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Info.count).to eq 0
    end
  end
end
