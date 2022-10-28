class User < ApplicationRecord
  has_many :tours, foreign_key: 'user_id'
  has_many :reservations, foreign_key: 'user_id'

  validates :name, presence: true
  has_secure_password
  validates :email, presence: true
end
