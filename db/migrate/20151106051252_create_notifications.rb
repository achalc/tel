class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :suggestion_id
      t.integer :user_id
      t.boolean :seen

      t.timestamps null: false
    end
  end
end
