# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 User.delete_all
 Sub.delete_all
 Post.delete_all


a = User.create!(username: "shitlord420", email: "sillyanne_kimberly@vomit.io", password: "stardust")
b = User.create!(username: "shashta", email: "mainecoon@cat.io" , password: "stardust")
c = User.create!(username: "freddy", email: "orange_cat@meow.io", password: "stardust")
d = User.create!(username: "pumpkin", email: "punkin@mew.io", password: "stardust")
e = User.create!(username: "granola", email: "labrador_nonretriever@dog.io", password: "stardust")

sub1 = Sub.create!(title: "CookingCatnip", description: "420 blaze it", moderator_id: a.id)
sub2 = Sub.create!(title: "MousePatrol", description: "collectible mouse toys!", moderator_id: b.id)
sub3 = Sub.create!(title: "DogsOnly", description: "DOGS ONLY", moderator_id: c.id)




post1 = Post.create!(title: "I meow for ice cream", url: "dontpukeonthecouch.com", content: "MEOW", user_id: c.id, sub_ids: [sub1.id]) 
post2 = Post.create!(title: "Where can I find White Widow", url: "dontpukeonthecouch.com", content: "MEOW", user_id: a.id, sub_ids: [sub1.id])
post3 = Post.create!(title: "Are cobwebs in drying catnip OK?", url: "dontpukeonthecouch.com", content: "MEOW", user_id: b.id, sub_ids: [sub1.id])
post4 = Post.create!(title: "Let's see the mouse collections!", url: "dontpukeonthecouch.com", content: "MEOW", user_id: b.id, sub_ids: [sub2.id]) 
post5 = Post.create!(title: "LET'S EAT DELICIOUS ROADKILL", url: "dontpukeonthecouch.com", content: "WOOF", user_id: d.id, sub_ids: [sub3.id])


