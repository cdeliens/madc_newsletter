require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :title => "MyString",
      :html_body => "MyText"
    ))
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input#template_title[name=?]", "template[title]"

      assert_select "textarea#template_html_body[name=?]", "template[html_body]"
    end
  end
end
