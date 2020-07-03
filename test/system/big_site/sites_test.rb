require "application_system_test_case"

module BigSite
  class SitesTest < ApplicationSystemTestCase
    setup do
      @site = big_site_sites(:one)
    end

    test "visiting the index" do
      visit sites_url
      assert_selector "h1", text: "Sites"
    end

    test "creating a Site" do
      visit sites_url
      click_on "New Site"

      check "Deleted" if @site.deleted
      fill_in "Domain", with: @site.domain
      fill_in "Name", with: @site.name
      fill_in "User", with: @site.user_id
      click_on "Create Site"

      assert_text "Site was successfully created"
      click_on "Back"
    end

    test "updating a Site" do
      visit sites_url
      click_on "Edit", match: :first

      check "Deleted" if @site.deleted
      fill_in "Domain", with: @site.domain
      fill_in "Name", with: @site.name
      fill_in "User", with: @site.user_id
      click_on "Update Site"

      assert_text "Site was successfully updated"
      click_on "Back"
    end

    test "destroying a Site" do
      visit sites_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Site was successfully destroyed"
    end
  end
end
