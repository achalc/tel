class FixFavFkDataTypes < ActiveRecord::Migration
  def change
  	remove_column :favorites, :user_id
  	remove_column :favorites, :suggestion_id
  	add_column :favorites, :user_id, :integer
  	add_column :favorites, :suggestion_id, :integer
  end
end
