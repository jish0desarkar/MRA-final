class Removetable1 < ActiveRecord::Migration[6.0]
  def change
    drop_table :meetings_users
  end
end
