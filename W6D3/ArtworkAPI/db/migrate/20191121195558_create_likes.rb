class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :likes
      t.references :likeable, polymorphic: true
      t.timestamps
    end
  end
end
