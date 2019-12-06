class CreatePostSubs < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :subs
  end
end
