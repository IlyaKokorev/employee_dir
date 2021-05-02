class User < ApplicationRecord
  rolify

  devise :database_authenticatable

  belongs_to :position

  validates :phone, :login, :email, uniqueness: true
  validates :email, format: Devise.email_regexp
end
