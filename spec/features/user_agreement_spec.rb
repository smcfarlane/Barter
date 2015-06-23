require 'rails_helper'
require 'factory_girl'
require 'pry'
RSpec.feature "UserAgreement", type: :feature do
  describe "user makes agreement successfully" do
    it 'signs in' do
      sign_in
      visit profile_index_path
      expect(page).to have_content("Profile #{@user.user_info.first_name}")
    end
    it 'creates new board' do
      sign_in
      visit new_board_path
      select("#{@skill2.name}", :from => 'skill_needed')
      check "#{@skill1.name}"
      click_button 'Submit'
      expect(page).to have_content(@user.user_info.first_name)
      expect(page).to have_content(@skill2.name)
      expect(page).to have_content((Time.mktime Time.now.year, Time.now.month, Time.now.day + 6).strftime("%D"))
    end
  end
  it 'allows other user to agree to a board matching skills from profile'
  it 'allows current user to visit board index agree'


  def sign_in
    @user = create(:user, email: 'dude_1@email.com' )
    @skill1, @skill2, @skill3 = create(:skill, name: 'plumbing'), create(:skill, name: 'IT'), create(:skill, name: 'landscaping')
    @user.skills << @skill1
    @user.save
    login_as(@user, :scope => :user)
  end
end
