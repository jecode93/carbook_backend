require "test_helper"

class BikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bike = bikes(:one)
  end

  test "should get index" do
    get bikes_url
    assert_response :success
  end

  test "should get new" do
    get new_bike_url
    assert_response :success
  end

  test "should create bike" do
    assert_difference("Bike.count") do
      post bikes_url, params: { bike: { deposit: @bike.deposit, description: @bike.description, duration: @bike.duration, finance_fee: @bike.finance_fee, name: @bike.name, option_to_purchase_fee: @bike.option_to_purchase_fee, total_amount_payable: @bike.total_amount_payable, user_id: @bike.user_id } }
    end

    assert_redirected_to bike_url(Bike.last)
  end

  test "should show bike" do
    get bike_url(@bike)
    assert_response :success
  end

  test "should get edit" do
    get edit_bike_url(@bike)
    assert_response :success
  end

  test "should update bike" do
    patch bike_url(@bike), params: { bike: { deposit: @bike.deposit, description: @bike.description, duration: @bike.duration, finance_fee: @bike.finance_fee, name: @bike.name, option_to_purchase_fee: @bike.option_to_purchase_fee, total_amount_payable: @bike.total_amount_payable, user_id: @bike.user_id } }
    assert_redirected_to bike_url(@bike)
  end

  test "should destroy bike" do
    assert_difference("Bike.count", -1) do
      delete bike_url(@bike)
    end

    assert_redirected_to bikes_url
  end
end
