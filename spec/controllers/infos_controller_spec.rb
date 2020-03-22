require 'rails_helper'

RSpec.describe InfosController, type: :controller do

  describe "info#new action" do
    it "should require users to be logged in" do
      get :new
    expect(response).to redirect_to new_user_session_path
    end


    it "should successfully show the new form" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "info#create action" do

    it "should require users to be logged in" do
      post :create, params: { gram: { message: "First gen" } }
      expect(response).to redirect_to new_user_session_path
  end

    it "should successfully create new info in our database" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      post :create, params: { info: { message: 'First gen' } }
      expect(response).to redirect_to root_path

      info = Info.last
      expect(info.message).to eq("First gen")
      expect(info.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = User.create(
        email:                 'fakeuser@gmail.com',
        password:              'secretPassword',
        password_confirmation: 'secretPassword'
      )
      sign_in user

      info_count = Info.count
      post :create, params: { info: { message: ''} }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Info_count).to eq Info.count
    end
  end
end

