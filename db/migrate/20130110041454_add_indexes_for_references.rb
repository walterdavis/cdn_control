class AddIndexesForReferences < ActiveRecord::Migration
  def up
    add_index :versions, :library_id
    add_index :libraries, :user_id
    add_index :uris, :version_id
  end

  def down
    remove_index :versions, :library_id
    remove_index :libraries, :user_id
    remove_index :uris, :version_id
  end
end