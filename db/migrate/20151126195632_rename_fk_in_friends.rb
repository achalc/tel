class RenameFkInFriends < ActiveRecord::Migration
  def change
  	remove_column :friends, :friend_id
  	remove_column :friends, :user_id
  	add_column :friends, :user_id_1, :integer
  	add_column :friends, :user_id_2, :integer
  end
end
