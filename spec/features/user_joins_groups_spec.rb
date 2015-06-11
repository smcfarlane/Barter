require 'rails_helper'
require 'factory_girl'
RSpec.feature "UserJoinsGroups", type: :feature do
  before :each do
    @user = create(:user)
  end
  scenario "join a group successfully" do
    sign_in
    click_button 'Join Group'
    expect(page).to have_content('Joined Successfully')
  end

  def sign_in
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
  end
end

