class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :tours, class_name: 'Tour'
end
