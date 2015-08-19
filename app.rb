require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("spec_helper")

get("/") do
  erb(:index)
end
