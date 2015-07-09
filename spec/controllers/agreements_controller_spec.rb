require 'rails_helper'

RSpec.describe AgreementsController, type: :controller do
  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"
  end

  describe "GET #index" do
    login_user
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    login_user
    it "returns http success" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      board, user2 = create(:board), create(:user)
      get :new, Board: board.id, user2: user2.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      board, user2 = create(:board), create(:user)
      get :create, user2: user2.id, board: board.id, details: Faker::Hacker.say_something_smart, offered_skill_id: 'IT', received_skill_id: 'plumbing', due_date: {year: '2015', month: '7', day: '17'}
      expect(response).to have_http_status(302)
    end

    it "doesn't continue to profile page if data is invalid" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      board, user2 = create(:board), create(:user)
      get :create, user2: user2.id, board: board.id, details: Faker::Hacker.say_something_smart, offered_skill_id: 'coding', received_skill_id: 'plumbing', due_date: {year: '2015', month: '7', day: '17'}
      expect(response).to redirect_to('where_i_came_from')
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      agreement, board = build(:agreement), create(:board)
      agreement.board_id = board.id
      agreement.save
      get :edit, id: agreement.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      agreement, board, user2 = build(:agreement), create(:board), create(:user)
      agreement.board_id = board.id
      agreement.save
      get :update, id: agreement.id, user2: user2.id, board: board.id, details: Faker::Hacker.say_something_smart, offered_skill_id: 'IT', received_skill_id: 'plumbing', due_date: {year: '2015', month: '7', day: '17'}
      expect(response).to have_http_status(302)
    end

    it "redirects to profile_path if both users have already agreed" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      agreement, board, user2 = build(:agreement), create(:board), create(:user)
      agreement.board_id = board.id
      agreement.user1_agrees = true
      agreement.user2_agrees = true
      agreement.save
      get :update, id: agreement.id, user2: user2.id, board: board.id, details: Faker::Hacker.say_something_smart, offered_skill_id: 'IT', received_skill_id: 'plumbing', due_date: {year: '2015', month: '7', day: '17'}
      expect(response).to redirect_to profile_path
    end


  end

  describe "GET #destroy" do
    it "returns http success" do
      s1, s2, s3 = create(:skill, name: 'IT'), create(:skill, name: 'plumbing'), create(:skill, name: 'sewing')
      agreement, board, user2 = build(:agreement), create(:board), create(:user)
      agreement.board_id = board.id
      agreement.save
      get :destroy, id: agreement.id
      expect(response).to have_http_status(302)
    end
  end

end
