require "application_system_test_case"

class GalaxiesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit galaxies_url
  #   assert_selector "h1", text: "All Galaxies"
  #   assert_selector ".column", count: Galaxy.count
  # end

  # test "lets a signed in user view their rentals" do
  #   login_as users(:test_user)
  #   visit galaxies_url
  #   click_link('My Rentals')
  #   assert_equal rents_path, page.current_path
  # end

  test "lets a signed in user create a new rental" do
    login_as users(:test_user)
    visit "/galaxies"
    click_link('Rent', match: :prefer_exact)
    sleep(3)

    fill_in "rent_start_date", with: Time.now + 2.days
      sleep(4)
    fill_in "rent_end_date", with: Time.now + 5.days
      sleep(4)
    click_on 'Create Rent'
      sleep(3)
    assert_text "Details for your rental"
  end
end

# use the method below to debug tests
  # save_and_open_screenshot
