# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

covers = ["https://res.cloudinary.com/dwustkks4/image/upload/v1587075689/captainamerica695-chrissamnee_m1satr.png", "https://res.cloudinary.com/dwustkks4/image/upload/v1587075705/HoC_Hulk_Cvr_A_zghlto.jpg", "https://res.cloudinary.com/dwustkks4/image/upload/v1587075720/91k6VF50sBL_rmxtzs.jpg", "https://res.cloudinary.com/dwustkks4/image/upload/v1586902662/fb2arhw1azhjgnqmbd00egetup0h.jpg"]
category = ["action", "adventure", "humour", "magazine"]
30.times do
  book = Book.create!(name: Faker::DcComics.title, category: category.sample)
  book.cover.attach(io: URI.open(covers.sample), filename: 'nes.png', content_type: 'image/png')
end
