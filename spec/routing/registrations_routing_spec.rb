# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegistrationsController, type: :routing do
  describe 'registrations routing' do
    it 'routes to #create' do
      expect(post: '/users').to route_to('registrations#create', format: :json)
    end
    it 'routes to #destroy' do
      expect(delete: '/users').to route_to('registrations#destroy', format: :json)
    end
    it 'routes to #update' do
      expect(put: '/users').to route_to('registrations#update', format: :json)
    end
    it 'routes to #update' do
      expect(patch: '/users').to route_to('registrations#update', format: :json)
    end
    it 'routes to #edit' do
      expect(get: '/users/edit').to route_to('registrations#edit', format: :json)
    end
    it 'routes to #sign_up' do
      expect(get: '/users/sign_up').to route_to('registrations#new', format: :json)
    end
    it 'routes to #cancel' do
      expect(get: '/users/cancel').to route_to('registrations#cancel', format: :json)
    end
  end
end
