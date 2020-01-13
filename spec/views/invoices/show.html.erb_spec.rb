require 'rails_helper'

RSpec.describe "invoices/show", type: :view do
  before(:each) do
    @invoice = assign(:invoice, Invoice.create!(
      :internal_id => "Internal",
      :external_id => "External",
      :description => "MyText",
      :counterparty_type => 2,
      :is_digitized => false,
      :gross_amount => "9.99",
      :tax_rate => "9.99",
      :tax => "9.99",
      :status => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Internal/)
    expect(rendered).to match(/External/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
  end
end
