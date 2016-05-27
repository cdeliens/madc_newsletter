# == Schema Information
#
# Table name: newsletters
#
#  id                  :integer          not null, primary key
#  name                :string
#  subscribers_list_id :integer
#  template_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :newsletter do
    name "MyString"
    subscribers_list
  end
end
