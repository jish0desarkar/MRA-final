class Meeting < ApplicationRecord
  # has_many :subscribers
  # has_many :users, through: :subscribers
  has_and_belongs_to_many :users
  belongs_to :room
  validate :capacity_validate
  validate :end_must_be_after_start
  validate :start_time_must_be_in_future
  validate :date_must_be_valid
  validate :slot_unavailable
  validate :time_must_be_valid

  def capacity_validate

    if (users.length > Room.where(id: room_id).pluck(:capacity).join.to_i)
      errors.add(:event_email, "Attendees are out of room capacity")
    end
    
  end



  def end_must_be_after_start
    if s_time >= e_time
      errors.add(:e_time, "must be after start time")
    end
  end
  def start_time_must_be_in_future
    if date < Date.today
      if s_time < Time.now
        errors.add(:s_time, "Time cannot be of the past")
      end
    end
  end
  def date_must_be_valid
    if date < Date.today
      errors.add(:date,"must be today or future")
    end
  end

  def time_must_be_valid
    if date < Time.now
      errors.add(:e_time,"must be now or future")
    end
  end

  def slot_unavailable
    count = 0
    count=Meeting.all.where("room_id= ? AND date= ? AND s_time<= ? AND e_time>= ?", room_id, date, s_time, e_time ).count
    if(count==0)
      
    else
      puts count
      puts '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'
      errors.add(:time, "Slot Booked")
      puts Meeting.all.where("room_id= ? AND date= ? AND s_time<= ? OR e_time>= ?", room_id, date, s_time, e_time ).pluck(:name)

    end

  end


end
