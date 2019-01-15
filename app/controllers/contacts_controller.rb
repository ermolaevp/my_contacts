# frozen_string_literal: true

class ContactsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_contact, only: %i[show update destroy]

  respond_to :json
  before_action :verify_requested_format!

  def index
    @q = current_user.contacts.ransack(q_to_hash)
    @contacts = @q.result(distinct: true).order(name: :asc).page(params[:page]).per(params[:per_page])
    respond_with(@contacts)
  end

  def show
    respond_with(@contact)
  end

  def create
    @contact = @user.contacts.new(contact_params)
    @contact.save
    respond_with(@contact, location: -> { user_contact_url(@user, @contact) })
  end

  def update
    @contact.update(contact_params)
    respond_with(@contact, json: @contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_contact
    @contact = @user.contacts.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :number, :email, :active)
  end

  def q_to_hash
    if params[:q].kind_of? String
      Hash[*params[:q].split(',')]
    else
      params[:q]
    end
  end
end
