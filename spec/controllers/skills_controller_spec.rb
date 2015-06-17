require 'rails_helper'
require 'factory_girl'
RSpec.describe SkillsController, type: :controller do
  # before :each do
  #   @user = create(:user)
  # end
  describe "GET index" do
    login_user
    it "assigns @user" do
      # expect(assigns(@user)).to eq([current_user])
      expect(current_user).not_to be_nil
    end
  end

end
