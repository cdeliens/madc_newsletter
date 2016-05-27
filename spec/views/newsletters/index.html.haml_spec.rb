require 'rails_helper'

RSpec.describe "newsletters/index", type: :view do
  before(:each) do
    assign(:newsletters, [
      Newsletter.create!(
        :name => "Name",
        :subscribers_list_id => 1
      ),
      Newsletter.create!(
        :name => "Name",
        :subscribers_list_id => 1
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
