# == Schema Information
#
# Table name: subscribers
#
#  id                  :integer          not null, primary key
#  first_name          :string
#  last_name           :string
#  email               :string
#  phone_number        :string
#  id_number           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  subscribers_list_id :integer
#

FactoryGirl.define do
  factory :subscriber do
    first_name "MyString"
    last_name "MyString"
    email "MyString"
    phone_number "MyString"
    id_number "MyString"
  end
end
