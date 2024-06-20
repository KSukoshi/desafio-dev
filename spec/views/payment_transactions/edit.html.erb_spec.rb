require 'rails_helper'

RSpec.describe "payment_transactions/edit", type: :view do
  let(:payment_transaction) {
    PaymentTransaction.create!(
      value: "9.99",
      cpf: "MyString",
      payment_card: "MyString",
      store_owner: "MyString",
      store_name: "MyString"
    )
  }

  before(:each) do
    assign(:payment_transaction, payment_transaction)
  end

  it "renders the edit payment_transaction form" do
    render

    assert_select "form[action=?][method=?]", payment_transaction_path(payment_transaction), "post" do

      assert_select "input[name=?]", "payment_transaction[value]"

      assert_select "input[name=?]", "payment_transaction[cpf]"

      assert_select "input[name=?]", "payment_transaction[payment_card]"

      assert_select "input[name=?]", "payment_transaction[store_owner]"

      assert_select "input[name=?]", "payment_transaction[store_name]"
    end
  end
end
