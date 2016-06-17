class User < ActiveRecord::Base
  has_many :blogs

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :email, :password, presence: true

  validates :name, length: { in: 2..20 }

  validates :password, length: { in: 7..20 }

  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save do
    self.email.downcase
  end

end
