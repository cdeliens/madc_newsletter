class AddSubscribersListIdToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscribers_list_id, :integer
  end
end
