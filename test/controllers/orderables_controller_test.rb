require "test_helper"

class OrderablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @orderable = orderables(:one)
  end

  test "should get index" do
    get orderables_url
    assert_response :success
  end

  test "should get new" do
    get new_orderable_url
    assert_response :success
  end

  test "should create orderable" do
    assert_difference("Orderable.count") do
      post orderables_url, params: { orderable: { nft_id: @orderable.nft_id, user_id: @orderable.user_id } }
    end

    assert_redirected_to orderable_url(Orderable.last)
  end

  test "should show orderable" do
    get orderable_url(@orderable)
    assert_response :success
  end

  test "should get edit" do
    get edit_orderable_url(@orderable)
    assert_response :success
  end

  test "should update orderable" do
    patch orderable_url(@orderable), params: { orderable: { nft_id: @orderable.nft_id, user_id: @orderable.user_id } }
    assert_redirected_to orderable_url(@orderable)
  end

  test "should destroy orderable" do
    assert_difference("Orderable.count", -1) do
      delete orderable_url(@orderable)
    end

    assert_redirected_to orderables_url
  end
end
