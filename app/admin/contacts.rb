# frozen_string_literal: true

ActiveAdmin.register Contact do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :number, :email, :active, :user_id
  form do |f|
    f.inputs do
      f.input :name
      f.input :number
      f.input :email
      f.input :active
      f.input :user
    end
    f.actions
  end
end
