class Sdgdfg < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :participants, :text, array: true, :default => []
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
