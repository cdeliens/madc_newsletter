# == Schema Information
#
# Table name: subscribers_lists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SubscribersList < ActiveRecord::Base
  validates :name, presence: true
  has_many :subscribers
end
