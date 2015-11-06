class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :suggestion_id
      t.string :filename

      t.timestamps null: false
    end
  end
end
