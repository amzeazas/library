require('spec_helper')

describe('Patron') do
  describe('#==') do
    it('is the same patron if it has the same name') do
      patron1 = Patron.new({:name => "Bruce Wayne"})
      patron2 = Patron.new({:name => "Bruce Wayne"})
      expect(patron1).to(eq(patron2))
    end
  end

  describe('#name') do
    it('returns the name of the patron') do
      test_patron = Patron.new({:name => "Bruce Wayne"})
      expect(test_patron.name()).to(eq("Bruce Wayne"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a patron to the array of saved patrons') do
      test_patron = Patron.new({:name => "Bruce Wayne"})
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end
end
