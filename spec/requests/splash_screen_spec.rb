require 'rails_helper'

RSpec.describe 'SplashScreen', type: :request do
  describe 'GET /' do
    it 'renders the home page with the correct content' do
      get unauthenticated_root_path
      expect(response).to have_http_status(:success)
    end
  end
end
