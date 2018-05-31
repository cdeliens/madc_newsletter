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

class Newsletter < ActiveRecord::Base
  belongs_to :subscribers_list
  belongs_to :template

  validates :subscribers_list, presence: true

  paginates_per 20
end
