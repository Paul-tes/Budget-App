require 'rails_helper'

RSpec.describe '/purchases', type: :feature do
  before :each do
    @user = User.create(name: 'Abel Gebeyehu', email: 'test@example.com', password: 'password',
                        password_confirmation: 'password')
    @category = Category.create(name: 'Movies', icon: 'Movie-image', user: @user)
    @purchase = Purchase.new(name: 'Avatar: The Way of Water', amount: 99.99, user: @user)
    @purchase.category = @category
    @purchase.save
    visit new_user_session_path
    within('body') do
      fill_in 'user_email', with: 'test@example.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    sleep 3
  end

  describe 'GET /index' do
    it 'returns http success' do
      visit category_purchases_path(@category)
      expect(page).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      visit category_purchases_path(@category, @purchase)
      expect(page).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      visit new_category_purchase_path(@category)
      expect(page).to have_http_status(:success)
    end
  end

  it 'Creates a new purchase' do
    visit "categories/#{@category.id}/purchases"
    expect(page).to have_content 'Avatar: The Way of Water'
    expect(page).to have_content '$99.99'
    click_link 'New purchase'
    fill_in 'Name', with: 'Black Panther 2'
    fill_in 'Price', with: 100
    click_button 'Save'
    expect(page).to have_content 'Black Panther 2'
  end
end
