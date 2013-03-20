class CreateUris < ActiveRecord::Migration
  def change
    create_table :uris do |t|
      t.references :version
      t.string :file_name
      t.string :file_uid

      t.timestamps
    end
  end
end
