class Subscribertable < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.references :meeting
      t.references :user
      t.timestamps
    end
    
  end
end
