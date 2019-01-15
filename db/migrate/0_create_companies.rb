# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, unique: true, null: false
      t.string :url, unique: true, null: false

      t.timestamps
    end
  end
end
