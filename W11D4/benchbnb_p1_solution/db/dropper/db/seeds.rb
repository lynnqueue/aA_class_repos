# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# The first step of any seed file should be to destroy all current records
Drop.destroy_all
User.destroy_all
Location.destroy_all
# Good practice to destroy data with references first i.e. Drops reference user_ids,
# users reference location_ids

# locations
# Note: We use .create! here as it will fail LOUDLY, making debugging easier 
# .create! will create and save all at once
syd = Location.create!(name: 'Sydney, Australia')
gg = Location.create!(name: 'Gold Coast, Australia')
ny = Location.create!(name: 'New York, US')
sf = Location.create!(name: 'San Francisco, US')
lon = Location.create!(name: 'London, UK')

# Users
toby = User.create!(username: 'Toby', location_id: ny.id, password: 'hunter2')
  # .create method will iterate over the hash arg provided and use each key's(column) setter method to set the value
leo = User.create!(username: 'Leonardo', location_id: sf.id, password: 'hunter2')
andy = User.create!(username: 'Andy', location_id: syd.id, password: 'hunter2')
kafele = User.create!(username: 'Kafele', location_id: ny.id, password: 'hunter2')
peter = User.create!(username: 'Peter', location_id: ny.id, password: 'hunter2')
rosemary = User.create!(username: 'Rosemary', location_id: ny.id, password: 'hunter2')
valerie = User.create!(username: 'Valerie', location_id: lon.id, password: 'hunter2')

# Drops
l1 = Drop.create!(
  body: "G'day mate!", 
  author_id: andy.id
)
l2 = Drop.create!(
  body: "Hey developers!", 
  author_id: peter.id
  )
l3 = Drop.create!(
  body: "Top 'o the morning!", 
  author_id: kafele.id
)
l4 = Drop.create!(
  body: "Kumusta!", 
  author_id: rosemary.id
)
l5 = Drop.create!(
  body: "Howdy y'all!", 
  author_id: valerie.id
)
l6 = Drop.create!(
  body: "I'm a puddin'", 
  author_id: leo.id
)
l7 = Drop.create!(
  body: "zzzzzzzz...", 
  author_id: toby.id
)
l8 = Drop.create!(
  body: "900 dollarydoos!", 
  author_id: andy.id
)
l9 = Drop.create!(
  body: "Tobias! Did you accept a collect call from the states?", 
  author_id: andy.id
)
l10 = Drop.create!(
  body: "It was an emergency", 
  author_id: toby.id
)