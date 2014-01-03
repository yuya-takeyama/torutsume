class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.reference :user
      t.reference :text
      t.string :commit_id
      t.int :line_number
      t.text :body

      t.timestamps
    end
  end
end
