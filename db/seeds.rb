# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CSV.read('list_of_books', headers: true)

list_of_books.each do |info|
  book = Book.where({
    title: info[:title],
    author: info[:author],
    rating: info[:rating]
    }).first

  if book.nil?
    book = Book.new(info)
  else
    book.assign_attributes = info
  end

  book.save!
end

