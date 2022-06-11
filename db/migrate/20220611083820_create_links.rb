class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.references :user
      t.string :url,          null: false
      t.string :shorter_url
      t.integer :clicked,     default: 0
      t.timestamps            null: false
    end
  end
end
