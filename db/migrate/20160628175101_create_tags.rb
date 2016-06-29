class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
        t.belongs_to :post, index: true
        t.belongs_to :category, index: true
        t.string :name, uniqueness: true
        t.timestamps null: false
    end
  end
end
