class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(params.require(:post).permit(:date, :rationale))
        @post.save
        
        redirect_to(@post, :notice => "Thank you. You good lookin person you.")
    end

    def show
        @post = Post.find(params[:id])
    end

end
