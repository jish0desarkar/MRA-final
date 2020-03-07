class Renametable < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_meeting, :users_meetings
  end
end
