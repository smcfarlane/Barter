require 'rails_helper'
require 'factory_girl'

RSpec.describe BoardsController, type: :controller do
  # before :each do
  #   allow(controller).to receive(:authenticate_user!).and_return(true)
  # end
  describe "GET #index" do
    login_user
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

      expect(Board.all).to match_array([board1, board2])
    end
  end

  describe "GET #show" do
    login_user
    it "returns http success" do
      thread = create(:message_thread)
      message1, message2 = create(:message), create(:message)
      board = create(:board)
      thread.discussable_id = board.id
      thread.save
      get :show, id: board.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    login_user
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    login_user
    it "returns http success" do
      skill1, skill2 = create(:skill), create(:skill)
      post :create, 'skill_needed' => 'IT', "skill::#{skill1.id}" => 'on', "skill::#{skill2.id}" => 'on', 'city' => 'city', 'contact_email' => subject.current_user.email, 'needed_by' => {'year' => '2015', 'month' => '7', 'day' => '17'}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #edit" do
    login_user
    it "returns http success" do
      board = create(:board)
      get :edit, id: board.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    login_user
    it "returns http success" do
      skill1, skill2 = create(:skill), create(:skill)
      board = create(:board)
      put :update, 'id' => board.id, 'skill_needed' => 'IT', "skill::#{skill1.id}" => 'on', "skill::#{skill2.id}" => 'on', 'city' => 'city', 'contact_email' => subject.current_user.email, 'needed_by' => {'year' => '2015', 'month' => '7', 'day' => '17'}
      expect(response).to have_http_status(302)
    end
  end

  describe "GET #destroy" do
    login_user
    it "returns http success" do
      board = create(:board)
      get :destroy, id: board.id
      expect(response).to have_http_status(302)
    end
  end

end
