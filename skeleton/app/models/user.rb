# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :user_name, :session_token, :password_digest, presence: true, uniqueness: true
  validates :password, length: {minimum: 6, allow_nil: true}

  attr_reader :password
    
  def reset_session_token!
      self.session_token = self.class.generate_session_token
      self.save!
      self.session_token
    end
  
  
  def generate_session_token
    SecureRandom::urlsafe_base64
  end
  
  def password=(input_password)
    @password = input_password
    password_digest = BCrypt::Password.create(password)
  end
  
  
  def is_password?(password)
    password_digest == BCrypt::Password.new(password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(user_name,password)
    user = User.find_by(user_name: user_name)
    return nil unless user && user.is_password?(password)
    user
  end
  
  
  
  
  
end
