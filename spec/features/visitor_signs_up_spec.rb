require 'rails_helper'
require 'factory_girl'
RSpec.feature 'Visitor signs up', :type => :feature do
  scenario 'with valid info' do
    sign_up
    #expect(page).to have_content('Log Out')
  end

  def sign_up
    visit new_user_registration_path
    fill_in 'First name', with: 'first_name'
    fill_in 'Last name', with: 'last_name'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Phone', with: '123-123-1234'
    fill_in 'Street address', with: '1234 ray st'
    fill_in 'Street address 2', with: 'apt 4'
    fill_in 'City', with: 'San Diego'
    fill_in 'State', with:'CA'
    fill_in 'Zip', with:'12344'
  end
end