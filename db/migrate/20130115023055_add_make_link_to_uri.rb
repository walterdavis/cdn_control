class AddMakeLinkToUri < ActiveRecord::Migration
  def change
    add_column :uris, :make_link, :boolean
  end
end
