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

class Contact < ApplicationRecord
  include Serializable
  belongs_to :user
  validates :number, phone: true
  validates :number, uniqueness: { scope: :user }
  before_validation :format_number
  before_save :downcase_email
  def to_s
    name || email || number
  end

  private

  def format_number
    self.number = NumberSanitizer.sanitize number
  end

  def downcase_email
    self.email = email.downcase if email
  end
end
