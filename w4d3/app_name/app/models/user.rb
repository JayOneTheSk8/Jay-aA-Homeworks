# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# require 'BCrypt'

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length: { minimum: 6, allow_nil: true }
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(passed_username, passed_password)
    user = User.find_by(username: passed_username)
    return user if user && BCrypt::Password.new(user.password_digest).is_password?(passed_password)
    nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token
    self.session_token = User.generate_session_token
    self.save ? self.session_token : nil
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def password=(new_password)
    @password = new_password
    # must use create because we want to render a string. Not a BCrpyt object.
    self.password_digest = BCrypt::Password.create(new_password)
  end
end
