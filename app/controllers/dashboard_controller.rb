class DashboardController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @newsletters = Newsletter.all
    @subscribers = Subscriber.all
    @templates = Template.all
    @last_log = NewsletterLog.last
    @count_emails = Newsletter.all.map { |e| e.subscribers_list.subscribers.count  }.sum

  end
end
