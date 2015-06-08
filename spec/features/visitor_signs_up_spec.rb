require 'rails_helper'
require 'factory_girl'
RSpec.feature 'Visitor signs up', :type => :feature do
  scenario 'with valid info' do
    sign_up
    expect(page).to have_content('Log Out')
  end

  scenario 'edit info after sign up' do
    sign_up
    visit edit_user_registration_path
    # expect(page).to have_content('first_name')
    # expect(page).to have_content('last_name')
    # expect(page).to have_content('email@email.com')
    # expect(page).to have_content('123-123-1234')
    # expect(page).to have_content('1234 ray st')
    # expect(page).to have_content('apt 4')
    # expect(page).to have_content('San Diego')
    # expect(page).to have_content('CA')
    # expect(page).to have_content('12344')
  end
  def sign_up
    visit new_user_registration_path
    fill_in 'First name', with: 'first_name'
    fill_in 'Last name', with: 'last_name'
    fill_in 'Email', with: 'email@email.com'
    fill_in 'Phone', with: '123-123-1234'
    fill_in 'Street address', with: '1234 ray st'
    fill_in 'Street address2', with: 'apt 4'
    fill_in 'City', with: 'San Diego'
    fill_in 'State', with:'CA'
    fill_in 'Zip', with:'12344'
    fill_in 'Password', with: 'asdfasdf'
    fill_in 'Password confirmation', with: 'asdfasdf'
    click_button 'Sign up'
  end
end