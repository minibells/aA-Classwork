class GoddamnIt < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :artist_id
    add_column :artworks, :artist_id, :integer
  end
end
