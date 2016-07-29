class CreateNewsletterLogs < ActiveRecord::Migration
  def change
    create_table :newsletter_logs do |t|
      t.string :newsletter
      t.string :user
      t.integer :emails
      t.string :template
      t.datetime :send_at

      t.timestamps null: false
    end
  end
end
