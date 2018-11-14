class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
                             message: "Invalid email" }
  validates :username, uniqueness: true
  validates_presence_of :email, :password
end
