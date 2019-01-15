# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  fixtures :users
  describe 'GET /users/1' do
    it 'works! (now write some real specs)' do
      user = users(:one)
      get user_path(user.id)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
