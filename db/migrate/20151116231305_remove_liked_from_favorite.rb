class RemoveLikedFromFavorite < ActiveRecord::Migration
  def change
  	remove_column :favorites, :liked
  end
end
