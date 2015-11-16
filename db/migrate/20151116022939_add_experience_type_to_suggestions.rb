class AddExperienceTypeToSuggestions < ActiveRecord::Migration
  def change
  	add_column :suggestions, :experience_type, :string
  end
end
