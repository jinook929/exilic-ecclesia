class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :time, default: "12:00"
      t.boolean :onsite, default: false
      t.text :description
      t.integer :spots

      t.timestamps
    end
  end
end
