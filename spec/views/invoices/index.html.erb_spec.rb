require 'rails_helper'

RSpec.describe "invoices/index", type: :view do
  before(:each) do
    assign(:invoices, [
      Invoice.create!(
        :internal_id => "Internal",
        :external_id => "External",
        :description => "MyText",
        :counterparty_type => 2,
        :is_digitized => false,
        :gross_amount => "9.99",
        :tax_rate => "9.99",
        :tax => "9.99",
        :status => 3
      ),
      Invoice.create!(
        :internal_id => "Internal",
        :external_id => "External",
        :description => "MyText",
        :counterparty_type => 2,
        :is_digitized => false,
        :gross_amount => "9.99",
        :tax_rate => "9.99",
        :tax => "9.99",
        :status => 3
      )
    ])
  end

  it "renders a list of invoices" do
    render
    assert_select "tr>td", :text => "Internal".to_s, :count => 2
    assert_select "tr>td", :text => "External".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
