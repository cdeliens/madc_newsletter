class DashboardController < ApplicationController
  before_action :authenticate_admin_user!

  def index
    @subscribers = Subscriber.all
  end
end
