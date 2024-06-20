require 'rails_helper'

RSpec.describe "payment_methods/new", type: :view do
  before(:each) do
    assign(:payment_method, PaymentMethod.new(
      payment_description: "MyString",
      payment_type: "MyString"
    ))
  end

  it "renders new payment_method form" do
    render

    assert_select "form[action=?][method=?]", payment_methods_path, "post" do

      assert_select "input[name=?]", "payment_method[payment_description]"

      assert_select "input[name=?]", "payment_method[payment_type]"
    end
  end
end
