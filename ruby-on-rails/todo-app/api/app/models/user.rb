require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :sessions, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  def password
    Password.new(password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end
end
