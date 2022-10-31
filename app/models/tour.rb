class Tour < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :reservations, foreign_key: 'tours_id'
end
