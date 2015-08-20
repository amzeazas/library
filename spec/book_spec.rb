require('spec_helper')

describe('Book') do
  describe('#==') do
    it('is the same book if it has the same title') do
      book1 = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      book2 = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      expect(book1).to(eq(book2))
    end
  end

  describe('#title') do
    it('returns the title of the book') do
      test_book = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      expect(test_book.title()).to(eq("The Hobbit"))
    end
  end

  describe('#author') do
    it('returns the author of the book') do
      test_book = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      expect(test_book.author()).to(eq("J.R.R. Tolkien"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Book.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a book to the array of saved books') do
      test_book = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      test_book.save()
      expect(Book.all()).to(eq([test_book]))
    end
  end

  describe("#update") do
    it("lets you update books in the database") do
      book = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien", :id => nil})
      book.save()
      book.update({:title => "The Hobbit: There and Back Again"})
      expect(book.title()).to(eq("The Hobbit: There and Back Again"))
    end
  end
end
