class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.boolean :family, default: false
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
