# == Schema Information
#
# Table name: newsletter_logs
#
#  id         :integer          not null, primary key
#  newsletter :string
#  user       :string
#  emails     :integer
#  template   :string
#  send_at    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :newsletter_log do
    newsletter "MyString"
    user "MyString"
    emails 1
    template "MyString"
    send_at "2016-07-29 11:16:40"
  end
end
