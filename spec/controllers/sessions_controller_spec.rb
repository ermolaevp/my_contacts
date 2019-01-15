# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
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

  let(:headers) do
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.headers.merge!(headers)
  end

  # describe "GET #index" do
  #   xit "returns a success response" do
  #     user = User.create! valid_attributes.merge(manager: managers(:one))
  #     get :index, params: {}, session: valid_session
  #     pp response.body
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET #show" do
  #   xit "returns a success response" do
  #     user = User.create! valid_attributes
  #     get :show, params: {id: user.to_param}, session: valid_session
  #     expect(response).to be_successful
  #   end
  # end

  describe 'POST #create' do
    context 'with valid params' do
      it 'renders a JSON response with the new JWT' do
        post :create, params: { user: valid_attributes }
        # pp response.request.headers['warden-jwt_auth.token'] #.to_a.last
        # pp response.headers.to_a
        # pp response.body
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        # expect(response.request.headers['Authorization']).to eq(auth_headers['Authorization'])
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new user' do
        post :create, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unauthorized)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     xit "updates the requested user" do
  #       user = User.create! valid_attributes
  #       put :update, params: {id: user.to_param, user: new_attributes}, session: valid_session
  #       user.reload
  #       skip("Add assertions for updated state")
  #     end

  #     xit "renders a JSON response with the user" do
  #       user = User.create! valid_attributes

  #       put :update, params: {id: user.to_param, user: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end

  #   context "with invalid params" do
  #     xit "renders a JSON response with errors for the user" do
  #       user = User.create! valid_attributes

  #       put :update, params: {id: user.to_param, user: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   xit "destroys the requested user" do
  #     user = User.create! valid_attributes
  #     expect {
  #       delete :destroy, params: {id: user.to_param}, session: valid_session
  #     }.to change(User, :count).by(-1)
  #   end
  # end
end
