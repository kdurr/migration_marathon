# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.foreach("db/data/list_of_books.csv", headers: true) do |list_of_books|
  info = {
    title: list_of_books["title"],
    author: list_of_books["author"],
    rating: list_of_books["rating"]
    }

  book = Book.where(info).first

  if book.nil?
    book = Book.new(info)
  end

  book.save!
  
end

list_of_categories = [ "Biography", "Fantasy", "Kids", "Mystery", "Romance", "Science Fiction" ]

existing_category = Categories.all.map { |r| r.categories }

list_of_categories.each do |genre|
  unless existing_category.include?(genre)
    Categories.create!(categories: genre)
  end
end

#Used http://stackoverflow.com/questions/3476987/appending-to-rake-dbseed-in-rails-and-running-it-without-duplicating-data
