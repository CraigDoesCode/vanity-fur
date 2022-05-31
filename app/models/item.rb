class Item < ApplicationRecord
  belongs_to :user, through: :bookings
end
