class AddSendedToNewsletter < ActiveRecord::Migration
  def change
    add_column :newsletters, :sended, :boolean, default: false
  end
end
