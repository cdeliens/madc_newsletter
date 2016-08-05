# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  name       :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Widget < ActiveRecord::Base

  def self.snippet
    file = File.open("public/snippet.js", "r")
    data = file.read
    file.close
    return data
  end

  def self.subscribers_list
    SubscribersList.find_by_name("Widget List")
  end

  def self.list_id
    SubscribersList.find_by_name("Widget List").id
  end
end
