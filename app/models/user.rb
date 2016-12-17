class User < ApplicationRecord
  has_secure_password
  has_many :groups
  has_many :members
  has_many :member_groups, through: :members, source: :group
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}
  validates :password, length: { minimum: 8 }, presence: true, confirmation: true, on: :create
end
