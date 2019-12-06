class AddNullFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :artworks, :artist_id, :integer, null: false
    change_column :users, :username, :string, null: false
  end
end
