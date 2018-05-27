require './author'
require './book'
require './reader'
require './order'
require 'yaml'
# Run this fiele to fill library with fake data
module Creator
  lib = {}
  authors = [
    author1 = Author.new('New Author', ' New Bio'),
    author2 = Author.new('Another Author', 'Second bio'),
    author3 = Author.new('Renown Author', 'Another Bio'),
    author4 = Author.new('Popular Author', 'Unique Bio'),
    author5 = Author.new('Legendary Author', 'Everyone know him')
  ]

  books = [
    book1 = Book.new('Bestseller', author1),
    book2 = Book.new('Lat Years Best Book', author2),
    book3 = Book.new('Path to Enlightenment', author3),
    book4 = Book.new('Some Good Book', author4),
    book5 = Book.new('All Time Greatest', author5)
  ]

  readers = [
    reader1 = Reader.new('New Reader', 'email', 'city', 'street', 'house'),
    reader2 = Reader.new('Good Reader', 'email', 'city', 'street', 'house'),
    reader3 = Reader.new('Nice Reader', 'email', 'city', 'street', 'house'),
    reader4 = Reader.new('Fine Reader', 'email', 'city', 'street', 'house')
  ]

  orders = [
    Order.new(book1, reader2, Date.today),
    Order.new(book2, reader3, Date.today),
    Order.new(book2, reader1, Date.today),
    Order.new(book3, reader3, Date.today),
    Order.new(book4, reader1, Date.today),
    Order.new(book5, reader4, Date.today),
    Order.new(book1, reader3, Date.today),
    Order.new(book3, reader4, Date.today),
    Order.new(book2, reader1, Date.today)
  ]

  datafile = 'lib_data.yml'
  lib = { authors: authors, books: books, readers: readers, orders: orders }
  File.open(datafile, 'w') { |file| file.write YAML.dump(lib) }
end
