# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Contacts', type: :request do
  fixtures :users
  before do
    @user = users(:one)
  end

  describe 'GET /users/1/contacts' do
    it 'works! (now write some real specs)' do
      get user_contacts_path(@user, format: :json)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
