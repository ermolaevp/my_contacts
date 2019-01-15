# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'registrations routing' do
    it 'routes to #new' do
      expect(get: '/users/sign_in').to route_to('sessions#new', format: :json)
    end
    it 'routes to #create' do
      expect(post: '/users/sign_in').to route_to('sessions#create', format: :json)
    end
    it 'routes to #destroy' do
      expect(delete: '/users/sign_out').to route_to('sessions#destroy', format: :json)
    end
  end
end
