# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :description
    end
  end
end
