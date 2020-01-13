require 'rails_helper'

RSpec.describe "invoices/new", type: :view do
  before(:each) do
    assign(:invoice, Invoice.new(
      :internal_id => "MyString",
      :external_id => "MyString",
      :description => "MyText",
      :counterparty_type => 1,
      :is_digitized => false,
      :gross_amount => "9.99",
      :tax_rate => "9.99",
      :tax => "9.99",
      :status => 1
    ))
  end

  it "renders new invoice form" do
    render

    assert_select "form[action=?][method=?]", invoices_path, "post" do

      assert_select "input[name=?]", "invoice[internal_id]"

      assert_select "input[name=?]", "invoice[external_id]"

      assert_select "textarea[name=?]", "invoice[description]"

      assert_select "input[name=?]", "invoice[counterparty_type]"

      assert_select "input[name=?]", "invoice[is_digitized]"

      assert_select "input[name=?]", "invoice[gross_amount]"

      assert_select "input[name=?]", "invoice[tax_rate]"

      assert_select "input[name=?]", "invoice[tax]"

      assert_select "input[name=?]", "invoice[status]"
    end
  end
end
