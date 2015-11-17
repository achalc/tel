class DropPhotosTable < ActiveRecord::Migration
  def up
    drop_table :photos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
