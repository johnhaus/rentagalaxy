require "application_system_test_case"

class GalaxiesTest < ApplicationSystemTestCase
  test "can visit the galaxies index" do
    visit galaxies_url
    assert_selector "h1", text: "All Galaxies"
    assert_selector ".column", count: Galaxy.count
  end

  test "can visit a galaxies show page" do
    visit galaxies_url
    assert_selector "h1", text: "All Galaxies"
    click_link('Details', match: :prefer_exact)
    assert_selector "h2", text: "Take a look at this great location"
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

  test "lets a signed in user delete a rental" do
    login_as users(:test_user1)
    visit "/galaxies"
    click_link('Rent', match: :prefer_exact)

    fill_in "rent_start_date", with: Time.now + 2.days
    fill_in "rent_end_date", with: Time.now + 5.days

    click_on 'Create Rent'
    assert_text "Details for your rental"
    visit rents_path
    click_link('Edit', match: :prefer_exact)
    click_link('Cancel Rental', match: :prefer_exact)
    assert_selector "h2", text: "My rentals"
    assert_not_nil :notice
  end

  test "user can't see or edit another user's rentals" do
    login_as users(:test_user1)
    visit "/galaxies"
    click_link('Rent', match: :prefer_exact)

    fill_in "rent_start_date", with: Time.now + 2.days
    fill_in "rent_end_date", with: Time.now + 5.days

    click_on 'Create Rent'
    assert_text "Details for your rental"
    visit "rents/#{Rent.first.id}"
    logout(:test_user1)

    login_as users(:test_user2)
    visit "rents/#{Rent.first.id}"
    assert_equal root_path, page.current_path
    assert_not_nil :notice

    visit "rents/#{Rent.first.id}/edit"
    assert_equal root_path, page.current_path
    assert_not_nil :notice
  end
end

# use the method below to debug tests
  # save_and_open_screenshot
