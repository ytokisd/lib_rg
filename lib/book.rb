# Class describes Book entity
class Book
  attr_accessor :title, :author
  def initialize(title, author)
    @title = title
    @author = author
  end
end
