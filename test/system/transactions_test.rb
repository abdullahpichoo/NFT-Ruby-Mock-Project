require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
  end

  test "visiting the index" do
    visit transactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "should create transaction" do
    visit transactions_url
    click_on "New transaction"

    fill_in "Buy price", with: @transaction.Buy_price
    fill_in "Buyer", with: @transaction.Buyer
    fill_in "Buyer", with: @transaction.Buyer_id
    fill_in "Change in price", with: @transaction.Change_in_price
    fill_in "Nft", with: @transaction.NFT_id
    fill_in "Nft name", with: @transaction.NFT_name
    fill_in "Seller", with: @transaction.Seller
    fill_in "Seller", with: @transaction.Seller_id
    fill_in "Transaction time", with: @transaction.transaction_time
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "should update Transaction" do
    visit transaction_url(@transaction)
    click_on "Edit this transaction", match: :first

    fill_in "Buy price", with: @transaction.Buy_price
    fill_in "Buyer", with: @transaction.Buyer
    fill_in "Buyer", with: @transaction.Buyer_id
    fill_in "Change in price", with: @transaction.Change_in_price
    fill_in "Nft", with: @transaction.NFT_id
    fill_in "Nft name", with: @transaction.NFT_name
    fill_in "Seller", with: @transaction.Seller
    fill_in "Seller", with: @transaction.Seller_id
    fill_in "Transaction time", with: @transaction.transaction_time
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Transaction" do
    visit transaction_url(@transaction)
    click_on "Destroy this transaction", match: :first

    assert_text "Transaction was successfully destroyed"
  end
end
