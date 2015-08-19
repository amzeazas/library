require('spec_helper')

describe('Book') do

  describe('#title') do
    it('returns the title of the book') do
      test_book = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien"})
      expect(test_book.title()).to(eq("The Hobbit"))
    end
  end

  describe('#author') do
    it('returns the title of the book') do
      test_book = Book.new({:title => "The Hobbit", :author => "J.R.R. Tolkien"})
      expect(test_book.author()).to(eq("J.R.R. Tolkien"))
    end
  end

end
