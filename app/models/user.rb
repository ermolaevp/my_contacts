# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  failed_attempts        :integer          default(0), not null
#  jti                    :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  unlock_token           :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  company_id             :bigint(8)        not null
#
# Indexes
#
#  index_users_on_company_id            (company_id)
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_unlock_token          (unlock_token) UNIQUE
#


class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  devise :database_authenticatable, :jwt_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable, :lockable, :timeoutable, :trackable, jwt_revocation_strategy: self
  belongs_to :company
  has_and_belongs_to_many :roles
  has_many :contacts

  def to_s
    email
  end

  def admin?
    role? Role.find_by(name: 'admin')
  end

  def role?(role)
    roles.include? role
  end

  def demo?
    email == 'demo@example.com'
  end

  def jwt_payload
    super.merge(id: id)
  end
end
