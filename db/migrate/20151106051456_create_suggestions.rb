class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.text :description
      t.boolean :liked
      t.string :location

      t.timestamps null: false
    end
  end
end
