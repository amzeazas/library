require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("spec_helper")

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
