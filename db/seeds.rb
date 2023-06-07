# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do |i|
#   Article.create(title: "This is title#{i}.", body: "This is body for article #{i}.")
# end

10.times do |i|
  Article.first.comments.create(comment: "This is #{i} comment.")
end
