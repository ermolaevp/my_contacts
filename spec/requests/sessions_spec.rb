# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  fixtures :users
  let(:valid_attributes) do
    {
      email: 'one@example.com',
      password: 'foobar'
    }
  end

  let(:invalid_attributes) do
    {
      email: 'invalid',
      password: '123'
    }
  end

  describe 'POST /users/sign_in' do
    it 'with valid params' do
      post user_session_path(user: valid_attributes, format: :json)
      expect(response).to have_http_status(:created)
    end

    it 'with invalid params' do
      post user_session_path(user: invalid_attributes, format: :json)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
