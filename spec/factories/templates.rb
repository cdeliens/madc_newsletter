# == Schema Information
#
# Table name: templates
#
#  id         :integer          not null, primary key
#  title      :string
#  html_body  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :template do
    title "MyString"
    html_body "MyText"
  end
end
