# frozen_string_literal: true

class ApidocController < ApplicationController
  protect_from_forgery except: :index
  def index
    @spec = ERB.new(File.read(Rails.root.join('doc/api/open_api.json'))).result
    @callback = params[:callback]
    respond_to do |format|
      format.html { render layout: false }
      format.json
      format.js
    end
  end
end
