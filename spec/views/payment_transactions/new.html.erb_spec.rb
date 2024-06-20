require 'rails_helper'

RSpec.describe "payment_transactions/new", type: :view do
  before(:each) do
    assign(:payment_transaction, PaymentTransaction.new(
      value: "9.99",
      cpf: "MyString",
      payment_card: "MyString",
      store_owner: "MyString",
      store_name: "MyString"
    ))
  end

  it "renders new payment_transaction form" do
    render

    assert_select "form[action=?][method=?]", payment_transactions_path, "post" do

      assert_select "input[name=?]", "payment_transaction[value]"

      assert_select "input[name=?]", "payment_transaction[cpf]"

      assert_select "input[name=?]", "payment_transaction[payment_card]"

      assert_select "input[name=?]", "payment_transaction[store_owner]"

      assert_select "input[name=?]", "payment_transaction[store_name]"
    end
  end
end
