# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times { Item.create!(title: "Item", price: 10, shipping_cost: 10, bids: 10, end_at: DateTime.new(2022, 02, 24, 9), image:"https://img.bfmtv.com/c/630/420/871/7b9f41477da5f240b24bd67216dd7.jpg") }
