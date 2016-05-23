class Template < ActiveRecord::Base
  validates :title, :html_body, presence: true
end
