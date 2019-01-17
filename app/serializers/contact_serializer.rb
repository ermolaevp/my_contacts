# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(TRUE)
#  email      :string
#  name       :string
#  number     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)        not null
#
# Indexes
#
#  index_contacts_on_user_id             (user_id)
#  index_contacts_on_user_id_and_number  (user_id,number) UNIQUE
#

class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :number, :email, :active
end
