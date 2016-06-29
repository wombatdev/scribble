
class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @tag = Tag.new
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.create!(post_params)
        redirect_to @post
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    def bump_up
        @post = Post.find(params[:id])
        puts @post
        puts @post.subject
        puts @post.bumps
        temp = @post.bumps + 1
        Post.update(@post, :bumps => temp)
        redirect_to (:back)
    end

    def bump_down
        @post = Post.find(params[:id])
        temp = @post.bumps - 1
        Post.update(@post, :bumps => temp)
        redirect_to (:back)
    end

    private
    def post_params
        params.require(:post).permit(:subject, :poster, :body, :bumps)
    end

end
