require "application_system_test_case"

class PackagesTest < ApplicationSystemTestCase
  setup do
    @package = packages(:one)
  end

  test "visiting the index" do
    visit packages_url
    assert_selector "h1", text: "Packages"
  end

  test "creating a Package" do
    visit packages_url
    click_on "New Package"

    fill_in "Addr from", with: @package.addr_from
    fill_in "Addr to", with: @package.addr_to
    fill_in "Email", with: @package.email
    fill_in "Height", with: @package.height
    fill_in "Length", with: @package.length
    fill_in "Midname", with: @package.midname
    fill_in "Name", with: @package.name
    fill_in "Phone", with: @package.phone
    fill_in "Surname", with: @package.surname
    fill_in "Weight", with: @package.weight
    fill_in "Width", with: @package.width
    click_on "Create Package"

    assert_text "Package was successfully created"
    click_on "Back"
  end

  test "updating a Package" do
    visit packages_url
    click_on "Edit", match: :first

    fill_in "Addr from", with: @package.addr_from
    fill_in "Addr to", with: @package.addr_to
    fill_in "Email", with: @package.email
    fill_in "Height", with: @package.height
    fill_in "Length", with: @package.length
    fill_in "Midname", with: @package.midname
    fill_in "Name", with: @package.name
    fill_in "Phone", with: @package.phone
    fill_in "Surname", with: @package.surname
    fill_in "Weight", with: @package.weight
    fill_in "Width", with: @package.width
    click_on "Update Package"

    assert_text "Package was successfully updated"
    click_on "Back"
  end

  test "destroying a Package" do
    visit packages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Package was successfully destroyed"
  end
end
