class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :user_id
      t.string :suggestion_id
      t.boolean :liked

      t.timestamps null: false
    end
  end
end
