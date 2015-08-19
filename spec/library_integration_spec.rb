require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new book', {:type => :feature}) do
  it('allows a user to new a list of books and add a new one') do
    visit('/')
    click_link('Add New Book')
    fill_in('title', :with => 'The Hobbit')
    fill_in('author', :with => 'J.R.R. Tolkien')
    click_button('Add Book')
    expect(page).to have_content('Success!')
  end
end
