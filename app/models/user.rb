class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :validates, presence: true, confirmation: true, length: { minimum: 4 }
  validates :name, presence: true

  has_many :calendars
  before_create :encrypt_password

  def self.login(user)
    pw = Digest::SHA1.hexdigest("a#{user[:password]}z")
    User.find_by(email: user[:email], password: pw)
  end

  private
  def encrypt_password
    self.password = Digest::SHA1.hexdigest("a#{self.password}z")
  end
end
