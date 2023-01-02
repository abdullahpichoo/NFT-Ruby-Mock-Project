require "application_system_test_case"

class OrderablesTest < ApplicationSystemTestCase
  setup do
    @orderable = orderables(:one)
  end

  test "visiting the index" do
    visit orderables_url
    assert_selector "h1", text: "Orderables"
  end

  test "should create orderable" do
    visit orderables_url
    click_on "New orderable"

    fill_in "Nft", with: @orderable.nft_id
    fill_in "User", with: @orderable.user_id
    click_on "Create Orderable"

    assert_text "Orderable was successfully created"
    click_on "Back"
  end

  test "should update Orderable" do
    visit orderable_url(@orderable)
    click_on "Edit this orderable", match: :first

    fill_in "Nft", with: @orderable.nft_id
    fill_in "User", with: @orderable.user_id
    click_on "Update Orderable"

    assert_text "Orderable was successfully updated"
    click_on "Back"
  end

  test "should destroy Orderable" do
    visit orderable_url(@orderable)
    click_on "Destroy this orderable", match: :first

    assert_text "Orderable was successfully destroyed"
  end
end
