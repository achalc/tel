class RemoveSuggestionIdFromNotifications < ActiveRecord::Migration
  def change
  	remove_column :notifications, :suggestion_id
  end
end
