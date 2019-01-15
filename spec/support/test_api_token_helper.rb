# frozen_string_literal: true

require 'devise/jwt/test_helpers'

module TestApiTokenHelper
  def self.api_token_for(user)
    Devise::JWT::TestHelpers.auth_headers({}, user)['Authorization']
  end
end
