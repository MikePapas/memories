# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password #ruby magic (truely) method that adds password and password_confirmation
  #attributes, requires presence of password, require they match AND add authenticate
  #method to compare an encrypted password to the password_digest to authenticate users
  # It works since we added password_digest column in database. Info: secure_password.tb
  has_many :memories, dependent: :destroy
  # alternatively:
  #before_save { self.email.downcase! }
  before_save { |user| user.email = email.downcase } #callback to force downcase 
  #before saving. A little advanced.. see Rails API on callbacks for more info...
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
  
end
