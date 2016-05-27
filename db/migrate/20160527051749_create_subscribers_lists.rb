class CreateSubscribersLists < ActiveRecord::Migration
  def change
    create_table :subscribers_lists do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
