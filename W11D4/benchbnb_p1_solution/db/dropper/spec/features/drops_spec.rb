require 'rails_helper'

# RSpec uses describe blocks. Capybara uses feature blocks

feature "creating a drop", type: :feature do 
  before :each do
    user = create :user 
    login_user(user)
    visit new_drop_url
  end

  # RSpec it blocks are scenario blocks in Capybara
  scenario "takes us to the right page" do
    expect(page).to have_content("Body")
    expect(page).to have_content("Create A Drop")
  end

  scenario "after creating drop, takes us to drops show page" do
    make_drop("hungry for lunch")

    expect(page).to have_content("hungry for lunch")
    expect(page).to have_content("One Single Drop")
  end
end

feature 'deleting a drop', type: :feature do
  before :each do
    user = create(:user)
    login_user(user)
    visit new_drop_url
    make_drop("to be deleted")
    click_button("Delete This Drop")
  end

  scenario "deletes the drop" do
    #This is a great spot to look at save_and_open_page. Again, this is a combination of capybara and the launchy gem that let's us view the page at that point in time.
    # save_and_open_page # opens html page at this moment to see what's going on
    expect(page).to_not have_content("to be deleted")
    expect(page).to have_content("All The Drops")
  end
end
