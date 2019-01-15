# frozen_string_literal: true

class CreateRolesUsersJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :roles, :users
  end
end
