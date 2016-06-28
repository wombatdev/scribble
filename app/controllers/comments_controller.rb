
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

    def edit
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
    end

    def update
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment = @post.comments.update(@comment, comment_params)
        redirect_to post_path(@post)
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to posts_path(@post)
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :commenter, :post_id)
    end

end
