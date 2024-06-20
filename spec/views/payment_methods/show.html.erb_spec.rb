require 'rails_helper'

RSpec.describe "payment_methods/show", type: :view do
  before(:each) do
    assign(:payment_method, PaymentMethod.create!(
      payment_description: "Payment Description",
      payment_type: "Payment Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Payment Description/)
    expect(rendered).to match(/Payment Type/)
  end
end
