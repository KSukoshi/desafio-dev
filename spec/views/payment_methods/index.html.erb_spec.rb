require 'rails_helper'

RSpec.describe "payment_methods/index", type: :view do
  before(:each) do
    assign(:payment_methods, [
      PaymentMethod.create!(
        payment_description: "Payment Description",
        payment_type: "Payment Type"
      ),
      PaymentMethod.create!(
        payment_description: "Payment Description",
        payment_type: "Payment Type"
      )
    ])
  end

  it "renders a list of payment_methods" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Payment Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Payment Type".to_s), count: 2
  end
end
