require 'rails_helper'

RSpec.describe "payment_transactions/index", type: :view do
  before(:each) do
    assign(:payment_transactions, [
      PaymentTransaction.create!(
        value: "9.99",
        cpf: "Cpf",
        payment_card: "Payment Card",
        store_owner: "Store Owner",
        store_name: "Store Name"
      ),
      PaymentTransaction.create!(
        value: "9.99",
        cpf: "Cpf",
        payment_card: "Payment Card",
        store_owner: "Store Owner",
        store_name: "Store Name"
      )
    ])
  end

  it "renders a list of payment_transactions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Cpf".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Payment Card".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Store Owner".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Store Name".to_s), count: 2
  end
end
