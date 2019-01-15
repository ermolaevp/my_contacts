# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  self.responder = ApplicationResponder
  respond_to :json, :html
  include ActionController::MimeResponds
  # around_action :handle_exceptions, if: proc { request.path.include?('/api') }

  # def handle_exceptions
  #   begin
  #     yield
  #   rescue ActiveRecord::RecordNotFound => e
  #     @status = 404
  #     @message = 'Record not found'
  #   rescue ActiveRecord::RecordInvalid => e
  #     render_unprocessable_entity_response(e.record) && return
  #   rescue ArgumentError => e
  #     @status = 400
  #   rescue StandardError => e
  #     @status = 500
  #   end
  #   render json: { success: false, message: @message || e.class.to_s, errors: [{ detail: e.message }] }, status: @status unless e.class == NilClass
  # end
  rescue_from CanCan::AccessDenied do |_exception|
    head :forbidden
  end
end
