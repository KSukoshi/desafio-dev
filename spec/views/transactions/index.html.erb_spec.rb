require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        value: 2.5,
        cpf: "Cpf",
        payment_card: "Payment Card",
        store_owner: "Store Owner",
        store_name: "Store Name"
      ),
      Transaction.create!(
        value: 2.5,
        cpf: "Cpf",
        payment_card: "Payment Card",
        store_owner: "Store Owner",
        store_name: "Store Name"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Payment Card".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Store Owner".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Store Name".to_s), count: 2
  end
end
