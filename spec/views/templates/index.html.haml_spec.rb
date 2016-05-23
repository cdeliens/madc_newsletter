require 'rails_helper'

RSpec.describe "templates/index", type: :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        :title => "Title",
        :html_body => "MyText"
      ),
      Template.create!(
        :title => "Title",
        :html_body => "MyText"
      )
    ])
  end

  it "renders a list of templates" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
