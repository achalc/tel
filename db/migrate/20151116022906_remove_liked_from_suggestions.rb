class RemoveLikedFromSuggestions < ActiveRecord::Migration
  def change
  	remove_column :suggestions, :liked
  end
end
