# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = [
  {name: 'Silly', birth_date: 'August 7 2018', color: 'White', sex: 'F'},
  {name: 'Misty', birth_date: 'August 7 2018', color: 'Calico', sex: 'F'},
  {name: 'Tay', birth_date: 'August 9 2018', color: 'Calico', sex: 'F'},
  {name: 'Blackie', birth_date: 'August 9 2018', color: 'Black', sex: 'M'},
  {name: 'Midnight', birth_date: 'August 9 2018', color: 'Black', sex: 'F'},
  {name: 'Other Misty', birth_date: 'August 3 2018', color: 'Ginger', sex: 'F'},
  {name: 'Callie', birth_date: 'August 17 2018', color: 'Calico', sex: 'F'},
  {name: 'Freddy', birth_date: 'August 17 2018', color: 'Ginger', sex: 'M'},
  {name: 'Magnus', birth_date: 'August 21 2018', color: 'Black', sex: 'M'}
]

cats.each { |cat| Cat.create! cat }