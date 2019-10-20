require "application_system_test_case"

class GalaxiesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit galaxies_url
    assert_selector "h1", text: "All Galaxies"
    assert_selector ".column", count: Galaxy.count
  end

  test "lets a signed in user view their rentals" do
    login_as users(:test_user1)
    visit galaxies_url
    click_link('My Rentals')
    assert_equal rents_path, page.current_path
  end

  test "lets a signed in user create a new rental" do
    login_as users(:test_user1)
    visit "/galaxies"
    click_link('Rent', match: :prefer_exact)

    fill_in "rent_start_date", with: Time.now + 2.days
    fill_in "rent_end_date", with: Time.now + 5.days

    click_on 'Create Rent'
    assert_text "Details for your rental"
  end

  test "user can't see or edit another user's rentals" do
    login_as users(:test_user1)
    visit "/galaxies"
    click_link('Rent', match: :prefer_exact)

    fill_in "rent_start_date", with: Time.now + 2.days
    fill_in "rent_end_date", with: Time.now + 5.days

    click_on 'Create Rent'
    assert_text "Details for your rental"
    logout(:test_user1)

    login_as users(:test_user2)
    visit "/rents/1"
    assert_equal root_path, page.current_path

    visit "/rents/1/edit"
    assert_equal root_path, page.current_path
  end
end

# use the method below to debug tests
  # save_and_open_screenshot
