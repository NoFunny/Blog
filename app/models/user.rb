class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def admin?
    role == 'admin'
  end

  after_create :assign_default_role

  # return digest for string

  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # return random token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # remember user in DB
  def remember
    self.remember_token = User.new_token
    update(remember_digest: User.digest(remember_token))
  end

  # returns true if token is the same as digest
  def authenticated?(remember_token)
    remember_digest.nil? ? false : BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # forget user
  def forget
    update(remember_digest: nil)
  end

  private

  def assign_default_role
    self.role = :user if role.blank?
  end
end
