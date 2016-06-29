class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :tags
    has_many :categories, through: :tags
end
