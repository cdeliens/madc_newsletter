class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :name
      t.integer :subscribers_list_id
      t.integer :template_id

      t.timestamps null: false
    end
  end
end
