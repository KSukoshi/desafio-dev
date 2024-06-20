require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      value: 1.5,
      cpf: "MyString",
      payment_card: "MyString",
      store_owner: "MyString",
      store_name: "MyString"
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[value]"

      assert_select "input[name=?]", "transaction[cpf]"

      assert_select "input[name=?]", "transaction[payment_card]"

      assert_select "input[name=?]", "transaction[store_owner]"

      assert_select "input[name=?]", "transaction[store_name]"
    end
  end
end
