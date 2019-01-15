# frozen_string_literal: true

require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Contacts' do
  explanation 'Contacts resource'
  authentication :apiKey, :api_key, description: 'Private key for API access', name: 'Authorization'
  header 'Content-Type', 'application/json'
  header 'Accept', 'application/json'
  let(:user) { users(:one) }
  let(:api_key) { TestApiTokenHelper.api_token_for(user) }
  let(:contact) { contacts(:one) }
  let(:valid_attributes) do
    {
      name: 'Matt Damon',
      email: 'matt@example.com',
      number: '+14048679034'
    }
  end

  get '/users/:user_id/contacts' do
    route_summary 'Get contacts'
    parameter :page, type: :integer
    parameter :per_page, type: :integer
    parameter :q, type: :string
    context 'when 200' do
      let(:user_id) { user.to_param }

      example 'Get contacts' do
        do_request
        expected_response = user.contacts.count
        expect(status).to eq(200)
        expect(JSON.parse(response_body).size).to eq(expected_response)
      end
    end
  end

  post '/users/:user_id/contacts' do
    route_summary 'Create contact'
    context 'when 201' do
      let(:user_id) { user.to_param }

      with_options scope: :contact, required: true do
        parameter :name, 'Name'
        parameter :email, 'Email'
        parameter :number, 'Number string', requred: true
      end

      example 'Create contact' do
        do_request(valid_attributes)
        expected_response = Contact.last.serialize
        expect(status).to eq(201)
        expect(response_body).to eq(expected_response)
      end
    end
  end

  get '/users/:user_id/contacts/:id' do
    route_summary 'Get contact'
    context 'when 200' do
      let(:id) { contact.to_param }
      let(:user_id) { user.to_param }

      example 'Get contact' do
        do_request
        expected_response = contact.serialize
        expect(status).to eq(200)
        expect(response_body).to eq(expected_response)
      end
    end
  end

  put '/users/:user_id/contacts/:id' do
    route_summary 'Update contact'
    context 'when 200' do
      let(:id) { contact.to_param }
      let(:user_id) { user.to_param }
      let(:new_attributes) do
        {
          contact: {
            name: 'other name'
          }
        }
      end

      with_options scope: :contact, required: true do
        parameter :name, 'Name'
        parameter :email, 'Email'
        parameter :number, 'Number string', requred: true
      end

      example 'Update contact' do
        do_request(new_attributes)
        expect(status).to eq(200)
        expect(response_body).to match(/other name/)
      end
    end
  end

  delete '/users/:user_id/contacts/:id' do
    route_summary 'Delete contact'
    context 'when 204' do
      let(:id) { contact.to_param }
      let(:user_id) { user.to_param }

      example 'Delete contact' do
        do_request
        expect(status).to eq(204)
      end
    end
  end
end
