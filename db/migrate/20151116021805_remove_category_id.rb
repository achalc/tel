class RemoveCategoryId < ActiveRecord::Migration
  def change
  	remove_column :suggestions, :category_id
  end
end
