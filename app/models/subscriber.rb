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

class Subscriber < ActiveRecord::Base
  validates :first_name, :last_name, :email, :subscribers_list_id, presence: true
  validates :email, uniqueness: true, email: true, on: :create

  belongs_to :subscribers_list
end
