class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :movie, null: false, foreign_key: true
      t.references :reviewer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
