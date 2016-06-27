class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.string :content
        t.string :commenter
        t.references :post, index: true, foreign_key: true
        t.timestamps null: false
    end
  end
end
