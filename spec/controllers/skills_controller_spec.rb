require 'rails_helper'
require 'factory_girl'
RSpec.describe SkillsController, type: :controller do
  before :each do
    @user = create(:user)
  end

  describe "GET #index" do
    login_user

    it "it returns http success" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "assigns @user" do
      get :index
      expect(assigns(:user)).to eq(subject.current_user)
    end
  end

  describe "GET show" do
    login_user

    it "it returns http success" do
      skills_user = create(:skills_user)
      get :show, id: skills_user.id
    end
  end

end
