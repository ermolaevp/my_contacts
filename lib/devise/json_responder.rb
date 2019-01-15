# frozen_string_literal: true

module Devise::JsonResponder
  protected

  def json_resource_errors
    {
      success: false,
      # errors: ResourceErrorFormatter.call(resource.errors)
      errors: resource.errors
    }
  end
end
