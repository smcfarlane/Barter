require 'rails_helper'
require 'factory_girl'
RSpec.feature "UserAgreement", type: :feature do
  # before :each do
  #   @user = create(:user, email: 'dude_1@email.com')
  #   @skill1, @skill2, @skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'landscaping')

    # @user.skills << @skill1
    # @user.save
  # end
  describe "user makes agreement successfully", :driver => :webkit do
    it 'signs in' do
      sign_in
      visit profile_index_path
      expect(page).to have_content("Profile #{@user.user_info.first_name}")
    end
    it 'visits board' do
      sign_in
      visit new_board_path
      # expect(page).to have_content('Create A Board Entry')
      save_and_open_page
      select("#{@skill1.name}", :from => 'skill_needed')
    #   expect(page).to have_content('Create')
    #   check('plumbing')
    #   fill_in 'City', with: 'San Diego'
    #   click_button 'Submit'
    #   expect(page).to have_content(@user.user_info.first_name)
    #   expect(page).to have_content(@user.board.skill_needed[0])
    #   expect(page).to have_content(@user.board.needed_by.strftime("%D"))
    #   fill_in 'Post New Message', 'I need plumbing!'
    #   click_button 'Submit'
    #   click_link 'Log Out'
    end
  end

  def sign_in
    @user = create(:user, email: 'dude_1@email.com' )
    @skill1, @skill2, @skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'landscaping')
    @user.skills << @skill1
    @user.save
    # visit new_user_session_path
    # fill_in 'Email', with: @user.email
    # fill_in 'Password', with: @user.password
    # click_button 'Log in'
    login_as(@user, :scope => :user)
  end
end