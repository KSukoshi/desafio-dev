require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  let(:transaction) {
    Transaction.create!(
      value: 1.5,
      cpf: "MyString",
      payment_card: "MyString",
      store_owner: "MyString",
      store_name: "MyString"
    )
  }

  before(:each) do
    assign(:transaction, transaction)
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(transaction), "post" do

      assert_select "input[name=?]", "transaction[value]"

      assert_select "input[name=?]", "transaction[cpf]"

      assert_select "input[name=?]", "transaction[payment_card]"

      assert_select "input[name=?]", "transaction[store_owner]"

      assert_select "input[name=?]", "transaction[store_name]"
    end
  end
end
