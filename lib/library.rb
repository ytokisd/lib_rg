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
    @library_data = @utils.load_file
  end

  def get_results(model_name, search_criteria, num_of_records)
    @library_data[:orders].group_by { |order| order.send(model_name).send(search_criteria) }
                          .max_by(num_of_records) { |_criteria, encountered_times| encountered_times.length}
  end

  def most_popular_book
    get_results('book', 'title', 1).first.first
  end

  def most_active_reader
    get_results('reader', 'name', 1).first.first
  end

  def three_popular_books_ordered_times
    book_ordered_times = 0
    get_results('book', 'title', 3).each do |book_ordered|
      book_ordered_times += book_ordered.last.length
    end
    book_ordered_times
  end

  def save_to_file(destination)
    @utils.write_file(destination, @library_data)
  rescue StandardError => e
    puts "Could not save data: #{e.message}"
  end

  def load_data
    puts @utils.load_file
  end
end
