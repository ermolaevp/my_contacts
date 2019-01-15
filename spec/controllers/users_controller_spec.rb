# frozen_string_literal: true

require 'rails_helper'
require 'devise/jwt/test_helpers'

RSpec.describe UsersController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    {
      email: 'some@email.com',
      password: 'somepassword',
      password_confirmation: 'somepassword'
    }
  end

  let(:invalid_attributes) do
    {
      email: 'invalid',
      password: '123',
      password_confirmation: '1234'
    }
  end

  let(:headers) do
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  # describe "GET #index" do
  #   xit "returns a success response" do
  #     user = User.create! valid_attributes.merge(manager: managers(:one))
  #     get :index, params: {}, session: valid_session
  #     pp response.body
  #     expect(response).to be_successful
  #   end
  # end

  describe 'GET #show' do
    it 'returns a success response' do
      user = users(:two)
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
      request.headers.merge!(auth_headers)
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
    it 'returns a forbidden response' do
      user1 = users(:third)
      user2 = users(:two)
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user1)
      request.headers.merge!(auth_headers)
      get :show, params: { id: user2.to_param }
      expect(response).to be_forbidden
    end
  end

  # describe "POST #create" do
  #   context "with valid params" do
  #     xit "creates a new User" do
  #       expect {
  #         post :create, params: {api_v1_current_manager_user: valid_attributes}, session: valid_session
  #       }.to change(User, :count).by(1)
  #     end

  #     xit "renders a JSON response with the new api_v1_current_manager_user" do

  #       post :create, params: {api_v1_current_manager_user: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to eq('application/json')
  #       expect(response.location).to eq(api_v1_current_manager_user_url(User.last))
  #     end
  #   end

  #   context "with invalid params" do
  #     xit "renders a JSON response with errors for the new api_v1_current_manager_user" do

  #       post :create, params: {api_v1_current_manager_user: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     xit "updates the requested api_v1_current_manager_user" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, api_v1_current_manager_user: new_attributes}, session: valid_session
  #       user.reload
  #       skip("Add assertions for updated state")
  #     end

  #     xit "renders a JSON response with the api_v1_current_manager_user" do
  #       user = User.create! valid_attributes

  #       put :update, params: {id: user.to_param, api_v1_current_manager_user: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end

  #   context "with invalid params" do
  #     xit "renders a JSON response with errors for the api_v1_current_manager_user" do
  #       user = User.create! valid_attributes

  #       put :update, params: {id: user.to_param, api_v1_current_manager_user: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   xit "destroys the requested api_v1_current_manager_user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: user.to_param}, session: valid_session
  #     }.to change(User, :count).by(-1)
  #   end
  # end
end
