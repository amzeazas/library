require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "library_test"})

get("/") do
  @books = Book.all()
  erb(:index)
end

get("/employee") do
  erb(:employee)
end

post("/") do
  book = Book.new({:title => params.fetch("title"), :author => params.fetch("author"), :id => nil})
  book.save()
  @books = Book.all()
  erb(:book_success)
end

get("/patrons") do
  @patrons = Patron.all()
  erb(:patrons)
end

post("/patrons") do
  patron = Patron.new({:first_name => params.fetch("first_name"), :last_name => params.fetch("last_name"), :phone => params.fetch("phone"), :id => nil})
  patron.save()
  @patrons = Patron.all()
  erb(:patron_success)
end
