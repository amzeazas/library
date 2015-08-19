class Book
  attr_reader(:title, :author)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
  end
end
