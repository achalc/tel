class AddPhotoToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :photo, :string
  end
end
