class Sdf < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :event_email
    
  end
end
