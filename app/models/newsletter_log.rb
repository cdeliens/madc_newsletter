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

class NewsletterLog < ActiveRecord::Base
end
