class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.string :subject
        t.string :poster
        t.string :body
        t.integer :bumps, :default => 0
        t.timestamps null: false
    end
  end
end
