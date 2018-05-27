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
    array_of_entities = []
    @library_data[:orders].each do |x|
      array_of_entities << x.instance_variable_get("@#{model_name}")
                            .instance_variable_get("@#{search_criteria}")
    end
    array_of_entities.group_by { |x| x }
                     .max_by(num_of_records) do |_criteria, encountered_times|
      encountered_times.length
    end
  end

  def most_popular_book
    get_results('book', 'title', 1).first.first
  end

  def most_active_reader
    get_results('reader', 'name', 1).first.first
  end

  def three_popular_books_ordered_times
    val = 0
    get_results('book', 'title', 3).each do |element|
      val += element.last.length
    end
    val
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
