require "rails_helper"

# .feature is global text |is provided by Capybara methods
# > acces interacting with the page
RSpec.feature "User submits a link" do

  scenario "they see the page for the submitted link" do
    link_title = "Home - Stuboki"
    link_url = "http://stuboki.com"

    #Visite home page
    visit root_path

    #This link will bring us to a new page to fill in our form
    click_on "Submit a new link"

    #fill_in find a method by its name, id or label and fills it in with given text
    fill_in "link_title", with: link_title
    fill_in "link_url", with: link_url

    #submit the form
    click_on "submit"

    #expect is Rspec method.It takes one value taking page object
    #to return value of #expect and pass it a matcher true/false
    #have_link is capybara, and returns true if it finds a link.
    #Rspec look auto for the method #has_link? when it sees #have_link
    expect(page).to have_link link_title, href: link_url

  end
end
