class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string :subject
        t.string :poster
        t.string :body
        t.timestamps null: false
    end
  end
end
