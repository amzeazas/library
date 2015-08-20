class Book
  attr_reader(:title, :author, :id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title())
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("SELECT * FROM books;")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      id = book.fetch("id").to_i()
      books.push(Book.new({:title => title, :author => author, :id => id}))
    end
    books
  end

  define_method(:save) do
    saved_book = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = saved_book.first.fetch("id").to_i()
  end

  define_method(:update) do |attributes|
    @title = attributes.fetch(:first_name)
    @id = self.id()
    DB.exec("UPDATE lists SET first_name = '#{@title}' WHERE id = #{@id};")
  end
end
