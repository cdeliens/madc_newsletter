require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      :title => "MyString",
      :html_body => "MyText"
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input#template_title[name=?]", "template[title]"

      assert_select "textarea#template_html_body[name=?]", "template[html_body]"
    end
  end
end
