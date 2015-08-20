require('spec_helper')

describe('Patron') do
  describe('#==') do
    it('is the same patron if it has the same name') do
      patron1 = Patron.new({:first_name => "Bruce", :last_name => "Wayne", :phone => "5038675309", :id => nil})
      patron2 = Patron.new({:first_name => "Bruce", :last_name => "Wayne", :phone => "5038675309", :id => nil})
      expect(patron1).to(eq(patron2))
    end
  end

  describe('#first_name') do
    it('returns the first name, last name, phone and id of the patron') do
      test_patron = Patron.new({:first_name => "Bruce", :last_name => "Wayne", :phone => "5038675309", :id => nil})
      expect(test_patron.first_name()).to(eq("Bruce"))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a patron to the array of saved patrons') do
      test_patron = Patron.new({:first_name => "Bruce", :last_name => "Wayne", :phone => "5038675309", :id => nil})
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end
end
