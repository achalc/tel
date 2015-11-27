class AddPicUrlToUser < ActiveRecord::Migration
  def change
  	remove_column :users, :photo_url, :string
  	add_column :users, :profile_picture, :string
  end
end
