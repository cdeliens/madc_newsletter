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

class Template < ActiveRecord::Base
  validates :title, :html_body, presence: true

  paginates_per 20
end
