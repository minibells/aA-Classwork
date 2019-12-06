class RenameTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts_subs, :post_subs
  end
end
