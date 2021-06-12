class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true, format: { with: /[\w]+@([\w-]+\.)+[\w-]{2,4}/ }
  validates :validates, presence: true, confirmation: true, length: { minimum: 4 }
  validates :name, presence: true
end
