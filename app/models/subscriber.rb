class Subscriber < ApplicationRecord
    belongs_to :meeting
    belongs_to :user
end
  