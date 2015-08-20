require('capybara/rspec')
require('launchy')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new book', {:type => :feature}) do
  it('allows a user to view a list of books and add a new one') do
    visit('/')
    click_link('Library Employees')
    fill_in('title', :with => 'The Hobbit')
    fill_in('author', :with => 'J.R.R. Tolkien')
    click_button('Add Book')
    expect(page).to have_content('Your book has been successfully added!')
  end
end

describe('adding a new patron', {:type => :feature}) do
  it('allows a user to view a list of patrons and add a new one') do
    visit('/employee')
    click_link('View Patron List')
    fill_in('first_name', :with => 'Bruce')
    fill_in('last_name', :with => 'Wayne')
    fill_in('phone', :with => '5038675309')
    click_button('Add Patron')
    expect(page).to have_content('The patron has been successfully added!')
  end
end
