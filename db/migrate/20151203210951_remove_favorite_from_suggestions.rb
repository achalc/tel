class RemoveFavoriteFromSuggestions < ActiveRecord::Migration
  def change
  	remove_column :suggestions, :favorite
  end
end
