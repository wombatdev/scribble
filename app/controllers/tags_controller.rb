
class TagsController < ApplicationController

    def new
        @post = Post.find(params[:post_id])
        @tag = Tag.new
    end

    def create
        @post = Post.find(params[:post_id])
        @tag = Tag.create!(tag_params)
        redirect_to post_path(@post)
    end

    def update
        @post = Post.find(params[:post_id])
        @tag = Tag.find(params[:id])
        @tag = @post.tags.update(@tag, tag_params.merge(post: @post))
        redirect_to post_path(@post)
    end

    def add_tag
        if Category.all.detect {|f| f["name"] == params[:tag][:name] }
            if Tag.all.detect {|f| f["name"] == params[:tag][:name] }
                puts "cat and tag exist, nothing created"
            else
                cat_name = params[:tag][:name]
                cat_id = Category.find_by(name: cat_name).id
                @tag = Tag.create!(name: params[:tag][:name], post_id: params[:tag][:post_id], category_id: cat_id)
                puts "only cat exists, created tag"
            end
        else
            if Tag.all.detect {|f| f["name"] == params[:tag][:name] }
                @category = Category.create!(name: params[:tag][:name])
                puts "only tag exists, created cat"
            else
                @category = Category.create!(name: params[:tag][:name])
                @tag = Tag.create!(name: params[:tag][:name], post_id: params[:tag][:post_id], category: @category)
                puts "neither exist, created both"
            end
        end
        redirect_to (:back)
    end

    private
    def tag_params
        params.require(:tag).permit(:name, :post_id, :category_id)
    end

end
