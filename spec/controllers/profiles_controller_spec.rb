require 'rails_helper'

RSpec.describe ProfileController, type: :controller do

  describe "GET #index" do
    login_user
    it 'returns success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
 end