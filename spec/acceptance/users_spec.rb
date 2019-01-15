# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Users' do
  explanation 'Users resource'
  header 'Content-Type', 'application/json'
  header 'Accept', 'application/json'
  let(:user) { users(:one) }
  let(:api_key) { TestApiTokenHelper.api_token_for(user) }
  let(:valid_attributes) do
    {
      email: 'newuser@example.com',
      password: 'foobar',
      password_confirmation: 'foobar',
      company_id: companies(:one).id
    }
  end

  get '/users/:id' do
    route_summary 'Get user'
    context 'when 200' do
      authentication :apiKey, :api_key, description: 'Private key for API access', name: 'Authorization'

      let(:id) { user.to_param }

      example 'Get user' do
        do_request
        expected_response = ActiveModelSerializers::SerializableResource.new(user).as_json.to_json
        expect(status).to eq(200)
        expect(response_body).to eq(expected_response)
      end
    end
  end

  post '/users/sign_in' do
    route_summary 'User login'
    context 'when 201' do
      with_options scope: :user, required: true do
        parameter :email, 'email'
        parameter :password, 'foobar'
      end
      let(:email) { user.email }
      let(:password) { 'foobar' }

      example 'User login' do
        do_request
        expect(status).to be 201
      end
    end
  end

  post '/users' do
    route_summary 'User signup'
    context 'when 201' do
      with_options scope: :user, required: true do
        parameter :email, 'email'
        parameter :password, 'foobar'
        parameter :password_confirmation, 'foobar'
        parameter :company_id, '1'
      end

      example 'User signup' do
        do_request(user: valid_attributes)
        expect(status).to be 201
      end
    end
  end
end
