class AddCategoryToSuggestions < ActiveRecord::Migration
  def change
  	add_column :suggestions, :category, :string
  end
end
