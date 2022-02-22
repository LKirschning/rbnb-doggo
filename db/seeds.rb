# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning up Database…"
Dog.destroy_all
puts "Database is clean"

30 times do
  Dog.create(
    name: Faker::Creature::Dog.name
    gender: Faker::Creature::Dog.gender
    breed: Faker::Creature::Dog.breed
    age: Faker::Creature::Dog.age
    size: Faker::Creature::Dog.size
    description: Faker::Lorem.paragraphs(number: 1)
  )
end
