class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :text, index: true
      t.string :commit_id
      t.integer :line_number
      t.text :body

      t.timestamps
    end
  end
end
