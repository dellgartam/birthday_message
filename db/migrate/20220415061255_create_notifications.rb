class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :name
      t.text :message
      t.string :time_sent
      t.timestamps
    end
  end
end
