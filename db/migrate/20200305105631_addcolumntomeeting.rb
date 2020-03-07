class Addcolumntomeeting < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :attending, :integer
  end
end
