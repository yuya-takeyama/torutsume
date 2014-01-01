class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.references :user, index: true
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
