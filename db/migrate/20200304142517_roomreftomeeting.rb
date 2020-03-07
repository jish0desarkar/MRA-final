class Roomreftomeeting < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :room, foreign_key: true
  end
end
