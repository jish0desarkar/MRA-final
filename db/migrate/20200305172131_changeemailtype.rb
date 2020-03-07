class Changeemailtype < ActiveRecord::Migration[6.0]
  def change
    change_column :meetings, :event_email, :text
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
