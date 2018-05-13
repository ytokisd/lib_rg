require "./utils.rb"
require "./library.rb"
puts "Please type a library file name (e. g. lib_data.yml)"
libdata = gets.chomp
library = Library.new(libdata)

loop do
  puts 'Welcome to my Library. Select a number to perform a task:
1 - Display the most active Reader
2 - Display the most popular book
3 - How many people ordered one of the three most popular books
4 - Save all Library data to file
5 - Get all Library data from file
6 - Exit'
  number = gets.to_i
  case number
  when 1 then library.often_takes_book
  when 2 then library.most_popular_book
  when 3 then library.three_popular_books
  when 4
  puts "Please enter new file name (e. g. new.yml)"
  destination = gets.chomp
  library.save_to_file(destination)
  when 5 then library.load_data
  when 6 then break
  else
  "You should enter a number from the description above"
  end
end