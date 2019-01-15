# frozen_string_literal: true

# == Schema Information
#
# Table name: roles_users
#
#  role_id :bigint(8)        not null
#  user_id :bigint(8)        not null
#


class RolesUser < ApplicationRecord
  belongs_to :user
  belongs_to :role
end
