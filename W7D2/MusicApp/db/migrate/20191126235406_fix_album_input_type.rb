class FixAlbumInputType < ActiveRecord::Migration[5.2]
  def change
    remove_column :albums, :band_id
    add_column :albums, :band_name, :string, null: false
  end
end
