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

# # == Schema Information
# #
# # Table name: subscribers
# #
# #  id                  :integer          not null, primary key
# #  first_name          :string
# #  last_name           :string
# #  email               :string
# #  phone_number        :string
# #  id_number           :string
# #  created_at          :datetime         not null
# #  updated_at          :datetime         not null
# #  subscribers_list_id :integer
# #
#
# require 'rails_helper'
#
# RSpec.describe Subscriber, type: :model do
#
#   let(:valid_attributes) {
#     {first_name: "Bob",
#      last_name: "Brenes",
#      email: Faker::Internet.email,
#      id_number: "10101010101",
#      phone_number: "124"
#     }
#   }
#
#   let(:invalid_attributes) {
#     {first_name: 123,
#      last_name: "Brenes",
#      email: "fake@mailinatorcom",
#      phone_number: "124"
#     }
#   }
#   context "validations" do
#     it "validates the presence of first_name" do
#       user = Subscriber.create()
#       expect(user.errors.messages).to include(:first_name)
#     end
#
#     it "validates the presence of last_name" do
#       user = Subscriber.create()
#       expect(user.errors.messages).to include(:last_name)
#     end
#
#     it "validates the presence of email" do
#       user = Subscriber.create()
#       expect(user.errors.messages).to include(:last_name)
#     end
#
#     it "validates the email uniqueness" do
#       user = Subscriber.create(valid_attributes)
#       duplicate_user_email = Subscriber.create(valid_attributes)
#       expect(duplicate_user_email.errors.messages).to include(:email => ["has already been taken"])
#     end
#
#     it "validates email format" do
#       user = Subscriber.create(invalid_attributes)
#       expect(user.errors.messages).to include(:email => ["is not an email"])
#     end
#   end
# end
