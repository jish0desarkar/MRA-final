class Removerefusers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :meeting_id
  end
end
