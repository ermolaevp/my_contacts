# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  name        :string           not null
#

class Role < ApplicationRecord
  before_save :downcase_name

  def to_s
    name
  end

  protected

  def downcase_name
    self.name = name.downcase
  end
end
