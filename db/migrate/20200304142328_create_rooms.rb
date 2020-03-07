class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :capacity
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
