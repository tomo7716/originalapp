# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Item.create!(name: "商品1", points: 1300, image_url: "sample1.png")
Item.create!(name: "商品2", points: 2200, image_url: "sample2.png")
Item.create!(name: "商品3", points: 3100, image_url: "sample3.png")
