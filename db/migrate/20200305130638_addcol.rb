class Addcol < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :event_email, :string
  end
end
