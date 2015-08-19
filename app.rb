require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "library"})

get("/") do
  @books = Book.all()
  erb(:index)
end

post("/") do
  title = params.fetch("title")
  author = params.fetch("author")
  book = Book.new({:title => title, :author => author})
  book.save()
  erb(:book_success)
end
