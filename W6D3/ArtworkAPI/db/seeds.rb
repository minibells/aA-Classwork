# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# ActiveRecord::Base.transaction do
#   ArtworkShare.destroy_all
#   Artworks.destroy_all
#   User.destory_all
# end


# users = [
#   { username: 'sillyanne' },
#   { username: 'Aleng' },
#   { username: 'Granola' },
#   { username: 'KFC' },
#   { username: 'Chicken Nugget' },
#   { username: 'Double Double' }
# ]

# users.each { |user| User.create! user }

# artworks = [
#   { title: "IMPOSSIBLE chikin" , image_url: 'jhgfd', artist_id: 2},
#   { title: "Invisible Bot Mobile", image_url: 'gnbjhgfdvfd', artist_id: 6},
#   { title: "Invisible HAMSTER", image_url: 'happy joy joy', artist_id: 4},
#   { title: "Turkish Toaster", image_url: 'jhgfds', artist_id: 1},
# ]

# artworks.each { |work| Artwork.create! work }


# viewers = [
#   { artwork_id: 3, viewer_id: 4 },
#   { artwork_id: 7, viewer_id: 4 },
#   { artwork_id: 8, viewer_id: 4 }
# ]

# viewers.each { |view| ArtworkShare.create! view }


comments = [
  { body: 'GOOOGLE MEEEEE', author_id: 2, artwork_id: 1 },
  { body: 'This artwork is bad.', author_id: 4, artwork_id: 2 },
  { body: 'This sandwich sucks.', author_id: 1, artwork_id: 4 },
  { body: 'I prefer popeyes.', author_id: 1, artwork_id: 2 },
  { body: 'Meow.', author_id: 2, artwork_id: 3 },
  { body: 'UHHHH BEAUTIFUL', author_id: 1, artwork_id: 3 }
]

comments.each { |comment| Comment.create! comment }