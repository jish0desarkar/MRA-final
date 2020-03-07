class Room < ApplicationRecord
  has_many :meetings, dependent: :destroy
  has_many :users, through: :meetings
end
