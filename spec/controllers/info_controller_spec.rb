require 'rails_helper'

RSpec.describe InfoController, type: :controller do
  describe "static_pages#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "info#new action" do
    it "should successfully show the new form" do

    end
  end
end
