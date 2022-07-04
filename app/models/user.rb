class User < ApplicationRecord
  has_many :questions
  has_many :answers

  # adds virtual attributes for authentication
  has_secure_password
  # validations
  validates :username, presence: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: 'Invalid email' }
  validates :password, presence: true, length: { minimum: 8 }
  validates_associated :questions, :answers
end
