class Removeuserid < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetings, :user_id
  end
end
