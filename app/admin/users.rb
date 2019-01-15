# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :company_id, :confirmed_at, role_ids: []

  before_create(&:skip_confirmation!)

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :roles do |user|
      user.roles.join(', ')
    end
    column :company
    column :confirmed?
    column :created_at
    actions
  end

  filter :email
  filter :roles
  filter :company
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :company
      f.input :confirmed_at
      f.input :roles, multiply: true
    end
    f.actions
  end
end
