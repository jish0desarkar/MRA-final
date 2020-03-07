class Addref < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :meeting, foreign_key: true
  end
end
