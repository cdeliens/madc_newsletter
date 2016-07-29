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
require 'csv'

class Subscriber < ActiveRecord::Base
  validates :first_name, :email, :subscribers_list_id, presence: true
  validates :email, uniqueness: true, email: true, on: :create

  belongs_to :subscribers_list

  def self.import_csv(file)
    counter = 0
    CSV.foreach(file.path, headers: true) do |row|
      subscriber = Subscriber.find_by_email(row.to_hash["email"]) || Subscriber.new
      subscriber.update_attributes(first_name: row.to_hash["name"], email: row.to_hash["email"], subscribers_list: SubscribersList.first) if row.to_hash.present?
      counter += 1
    end
  return counter
  rescue ActiveRecord::RecordInvalid => e
  end
end
