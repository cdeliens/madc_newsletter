class DashboardController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @newsletters = Newsletter.all
    @subscribers = Subscriber.all
    @templates = Template.all
    @last_log = NewsletterLog.last
    @count_emails = 0

    @widget_subscribers = Widget.subscribers_list
  end
end
