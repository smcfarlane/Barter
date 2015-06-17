require 'rails_helper'
require 'factory_girl'

RSpec.describe BoardsController, type: :controller do
  before :each do
    @user = create(:user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
    # https://github.com/plataformatec/devise/wiki/How-To:-Stub-authentication-in-controller-specs
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the boards into @boards" do
      board1, board2 = create(:board), create(:board)
      get :index

      expect(assigns(:boards)).to match_array([board1, board2])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in :user, @user
      board = create(:board)
      get :show, id: board.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in :user, @user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sign_in :user, @user
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

end
