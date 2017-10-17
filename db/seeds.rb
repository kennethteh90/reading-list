# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Reading.create(name: 'Harry Potter', author: 'JK Rowling', completed: true)

require 'faker'

20.times do
  Reading.create(name: Faker::Book.unique.title, author: Faker::Book.author, completed: Faker::Boolean.boolean)
end
