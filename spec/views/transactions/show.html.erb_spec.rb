require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    assign(:transaction, Transaction.create!(
      value: 2.5,
      cpf: "Cpf",
      payment_card: "Payment Card",
      store_owner: "Store Owner",
      store_name: "Store Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Cpf/)
    expect(rendered).to match(/Payment Card/)
    expect(rendered).to match(/Store Owner/)
    expect(rendered).to match(/Store Name/)
  end
end
