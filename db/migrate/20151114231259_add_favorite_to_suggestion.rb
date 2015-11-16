class AddFavoriteToSuggestion < ActiveRecord::Migration
  def change
  	add_column :suggestions, :favorite, :boolean
  end
end
