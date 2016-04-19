# == Schema Information
#
# Table name: subscribers
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  email        :string
#  phone_number :string
#  id_number    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Subscriber < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true, email: true, on: :create
end
