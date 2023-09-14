require 'rails_helper'

RSpec.describe '/categories', type: :feature do
  before :each do
    @user = User.create(name: 'Abel Gebeyehu', email: 'test@example.com', password: 'password',
                        password_confirmation: 'password')
    visit new_user_session_path
    within('body') do
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    sleep 3
  end

  it 'Check homepage content' do
    expect(page.body).to include('Categories')
    expect(page.body).to include('Log out')
    expect(page.body).to include('Most recent')
    expect(page.body).to include('Add category')
  end

  it 'Creating new group' do
    click_link 'Add category'
    expect(page).to have_content 'Add a Category'
    fill_in 'Name', with: 'Sports'
    fill_in 'Icon', with: 'FIFA'
    click_button 'Save'
    expect(page).to have_content 'Sports'
  end
end
