class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6}
  validates_presence_of :email, :password
end
