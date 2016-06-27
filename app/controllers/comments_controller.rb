
class CommentsController < ApplicationController

    def index
        @comments = Comment.all
    end

    def show
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    def new
        @post = Post.find(params[:post_id])
        @comment = Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.create!(comment_params.merge(post: @post))
        redirect_to post_path(@post)
    end



    private
    def comment_params
        params.require(:comment).permit(:content, :commenter, :post_id)
    end

end
