class Removeref < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :meeting_id
  end
end
