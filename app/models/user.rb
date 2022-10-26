class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, 
         jwt_revocation_strategy: JwtDenylist
  validates :name, presence: true
  validates :username, presence: true

  has_many :tours, foreign_key: 'user_id'
  has_many :reservations, foreign_key: 'user_id'
end
