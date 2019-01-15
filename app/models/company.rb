# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Company < ApplicationRecord
  has_many :users
end
