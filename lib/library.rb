require 'yaml'
require_relative './utils.rb'
require_relative './book.rb'
require_relative './author.rb'
require_relative './reader.rb'
require_relative './order.rb'
# Class describes Library entity
class Library
  attr_reader :utils, :library_data

  def initialize(datafile)
    @utils = Utils.new(datafile)
    @library_data = utils.load_file
  end

  def get_results(model_name, num_of_records = 1)
    library_data[:orders].group_by(&model_name.to_sym)
                         .max_by(num_of_records) { |_model, orders| orders.size }
                         .map(&:first)
  end

  def most_popular_book
    get_results('book').first.title
  end

  def most_active_reader
    get_results('reader').first.name
  end

  def three_popular_books_ordered_times
    popular_books = get_results('book', 3)
    library_data[:orders].select { |order| popular_books.include?(order.book) }
                         .map(&:reader).uniq.count
  end

  def save_to_file(destination)
    utils.write_file(destination, library_data)
  rescue StandardError => e
    puts "Could not save data: #{e.message}"
  end

  def load_data
    puts utils.load_file
  end
end
