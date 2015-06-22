require 'rails_helper'

RSpec.describe MessageController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    login_user
    it "returns http success" do
      get :create, thread_id: 1, text: Faker::Hacker.say_something_smart
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destory" do
    it "returns http success" do
      get :destory
      expect(response).to have_http_status(:success)
    end
  end

end
