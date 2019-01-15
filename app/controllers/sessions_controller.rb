# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  respond_to :json
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    # respond_with resource, location: after_sign_in_path_for(resource)
    render json: { token: current_token }, status: :created
  end

  private

  def current_token
    request.env['warden-jwt_auth.token']
  end
end
