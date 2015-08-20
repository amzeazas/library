class Patron
  attr_reader(:first_name, :last_name, :phone, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @phone = attributes.fetch(:phone)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |another_patron|
    self.first_name().==(another_patron.first_name()) && self.last_name().==(another_patron.last_name()) && self.phone().==(another_patron.phone()) && self.id.==(another_ptron.id())
  end

  define_singleton_method(:all) do
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      first_name = patron.fetch("first_name")
      last_name = patron.fetch("last_name")
      phone = patron.fetch("phone")
      id = patron.fetch("id")
      patrons.push(Patron.new({:first_name => first_name, :last_name => last_name, :phone => phone, :id => id}))
    end
    patrons
  end

  define_method(:save) do
    saved_patron = DB.exec("INSERT INTO patrons (first_name, last_name, phone) VALUES ('#{@first_name}', '#{@last_name}', '#{@phone}') RETURNING id;")
    @id = saved_patron.first.fetch("id").to_i()
  end
end
