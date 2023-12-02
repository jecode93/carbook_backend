require "application_system_test_case"

class BikesTest < ApplicationSystemTestCase
  setup do
    @bike = bikes(:one)
  end

  test "visiting the index" do
    visit bikes_url
    assert_selector "h1", text: "Bikes"
  end

  test "should create bike" do
    visit bikes_url
    click_on "New bike"

    fill_in "Deposit", with: @bike.deposit
    fill_in "Description", with: @bike.description
    fill_in "Duration", with: @bike.duration
    fill_in "Finance fee", with: @bike.finance_fee
    fill_in "Name", with: @bike.name
    fill_in "Option to purchase fee", with: @bike.option_to_purchase_fee
    fill_in "Total amount payable", with: @bike.total_amount_payable
    fill_in "User", with: @bike.user_id
    click_on "Create Bike"

    assert_text "Bike was successfully created"
    click_on "Back"
  end

  test "should update Bike" do
    visit bike_url(@bike)
    click_on "Edit this bike", match: :first

    fill_in "Deposit", with: @bike.deposit
    fill_in "Description", with: @bike.description
    fill_in "Duration", with: @bike.duration
    fill_in "Finance fee", with: @bike.finance_fee
    fill_in "Name", with: @bike.name
    fill_in "Option to purchase fee", with: @bike.option_to_purchase_fee
    fill_in "Total amount payable", with: @bike.total_amount_payable
    fill_in "User", with: @bike.user_id
    click_on "Update Bike"

    assert_text "Bike was successfully updated"
    click_on "Back"
  end

  test "should destroy Bike" do
    visit bike_url(@bike)
    click_on "Destroy this bike", match: :first

    assert_text "Bike was successfully destroyed"
  end
end
