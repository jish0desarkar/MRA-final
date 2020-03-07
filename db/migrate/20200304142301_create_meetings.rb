class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.date :date
      t.time :s_time
      t.time :e_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
