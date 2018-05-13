class Order
  attr_accessor :book, :reader, :date
  include Common 
  def initialize(book, reader)
    @book = book
    @reader = reader
    @date = Common.format_time
  end
end