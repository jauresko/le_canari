# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

cover = "https://res.cloudinary.com/dwustkks4/image/upload/v1588332178/bfc16twtdeq0vhub79qs8ol4uqgx.jpg"
category = ["action", "adventure", "humour", "magazine"]
i = 0
2.times do
  puts "Starting creating...."
  i = i+1
  book = Book.create!(name: Faker::DcComics.title, category: category.sample)
  book.cover.attach(io: URI.open(cover), filename: 'nes.png', content_type: 'image/png')
  puts "Done with book number #{i}"
end

