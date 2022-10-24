class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true

  has_many :tours, foreign_key: 'user_id'
  has_many :reservations, foreign_key: 'user_id'
end
