class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :title
      t.text :html_body

      t.timestamps null: false
    end
  end
end
